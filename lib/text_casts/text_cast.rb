class TextCast
  def initialize(input_stream: [], output_stream: [])
    @recording     = false
    @input_stream  = input_stream
    @output_stream = output_stream
  end

  def record
    self.recording = true
    input_stream.each do |frame|
      output_stream << frame
    end
  end

  def stop
    self.recording = false
  end

  def recording?
    recording
  end

  private

  attr_accessor :recording, :input_stream, :output_stream
end
