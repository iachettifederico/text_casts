require_relative "../../../lib/text_casts/text_cast"

describe TextCast do
  let(:text_cast) { TextCast.new }

  it "#recording? returns false if not recording" do
    text_cast.recording?.should be_false
  end

  it "#recording? returns tue if recording" do
    text_cast.record
    text_cast.recording?.should be_true
  end

  it "#recording? returns tue if the recording stopped" do
    text_cast.record
    text_cast.stop
    text_cast.recording?.should be_false
  end

  context "recording" do
    it "records one frame" do
      input     = double('input')
      output    = double('output')
      text_cast = TextCast.new(input_stream: input, output_stream: output)

      input.should_receive(:each).and_yield("THE FRAME")
      output.should_receive(:<<).with("THE FRAME").exactly(1)

      text_cast.record
    end
  end

end
