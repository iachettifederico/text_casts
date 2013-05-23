require 'fileutils'

initial_dir = Dir.pwd
output_dir = "/home/fedex/code/sandbox/recording"
project_name = "my_recording"


FileUtils.rm_r output_dir if Dir.exists? output_dir
system "rm -rf #{output_dir}" if Dir.exists? output_dir

Dir.mkdir output_dir
Dir.chdir output_dir do
  FileUtils.touch "#{project_name}_pid_#{Process.pid}"
  start_time = Time.now
  #1.upto(50) do
  loop do
    sleep 0.1
    current_file_name = [project_name, Time.now - start_time].join("_")
    commands = [
                %W[touch #{current_file_name}],
                %W[tmux capture-pane],
                %W[tmux save-buffer #{current_file_name}],
    ]
    commands.each { |command| system *command }
  end

end

system "notify-send 'Listo'; echo 'Listo'; exit"
