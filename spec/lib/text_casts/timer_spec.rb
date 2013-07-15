require_relative "../../../lib/text_casts/timer"

Clock = Struct.new(:now) do
  def initialize(now: Time.now)
    self.now = now
  end

  def add_milisecs(milisecs)
    self.now += (milisecs * 0.001)
  end
end


describe Timer do
  let(:timer) { Timer.new }

  it "#elapsed returns 0" do
    timer.elapsed.should == 0
  end

  it "can be started" do
    timer.started?.should == false
    timer.start
    timer.started?.should == true
  end

  describe "#elapsed" do
    let(:clock) { Clock.new }
    let(:timer) { Timer.new(clock: clock) }

    it "returns the amount of miliseconds elapsed since the start time" do
      timer.elapsed.should == 0
      timer.start

      clock.add_milisecs(5)
      timer.elapsed.should == 5
    end
  end

end
