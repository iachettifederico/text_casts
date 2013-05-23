require 'fileutils'

$initial_dir = Dir.pwd
$output_dir = "/home/fedex/code/sandbox/recording"
$project_name = "my_recording"

def timestamps
  return @timestamps if @timestamps
  filenames = `ls #{$output_dir}`.split("\n")
  @timestamps = filenames.map! { |filename| filename[/#{$project_name}_(\d+\.\d+)/,1].to_f}.sort!
end

slides = Dir.chdir $output_dir do
  timestamps.each_with_object({}) do |timestamp, h|
    current_file_name = "#{$project_name}_#{timestamp}"
    h[timestamp] = `cat #{current_file_name}`
  end
end

start_time = Time.now
slides.each do |timestamp, slide|
  #system "clear"
  puts slide
  sleep 0.00000000001 while timestamp > (Time.now - start_time)
end

#start_time = Time.now
#until ((current_time=(Time.now-start_time)) > timestamps.last)
#  current_slot = slides.keys.each_cons(2).find { |s, e| current_time.between?(s,e) }
#  if current_slot && current_slot != @last_slot
#    @last_slot = current_slot
#    system "clear"
#    puts slides[current_slot.first]
#  end
#end
