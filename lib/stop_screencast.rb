$output_dir = "/home/fedex/code/sandbox/recording"
$project_name = "my_recording"

def pid
  filenames = `ls #{$output_dir}`.split("\n")
  filenames.map { |filename| filename[/#{$project_name}_pid_(\d+)/,1]}.compact.first
end

system "kill -9 #{pid}"
