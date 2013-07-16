# TextCast starts a Recording
# TextCast stops a Recording
# TextCast records  one Frame
require_relative "../../lib/text_casts/text_cast"

describe "a TextCast" do
  it "starts and stops a recording" do
    text_cast = TextCast.new
    text_cast.recording?.should be_false
    text_cast.record
    text_cast.recording?.should be_true
    text_cast.stop
    text_cast.recording?.should be_false
  end

  context "recording" do
    it "records one frame" do
      input_stream  = ["THE FRAME"]
      output_stream = Output.new
      text_cast = TextCast.new(input_stream: input_stream, output_stream: output_stream)

      text_cast.record
      text_cast.stop

      output_stream.frames.should == ["THE FRAME"]
    end

    it "records several frame" do
      input_stream  = %W[one two three]
      output_stream = Output.new
      text_cast = TextCast.new(input_stream: input_stream, output_stream: output_stream)

      text_cast.record
      text_cast.stop

      output_stream.frames.should == %W[one two three]
    end
  end
end


class Input
  def initialize(frames)
    @frames = frames
  end

  def each
    Array(frames).each do |frame|
      yield frame.shift
    end
  end
end

class Output
  attr_reader :frames
  def <<(frame)
    @frames ||= []
    @frames << frame
  end
end
