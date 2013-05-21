require 'fileutils'

initial_dir = Dir.pwd
output_dir = "/home/fedex/code/sandbox/recording"
output_file = "output.txt"

FileUtils.rm_r output_dir if Dir.exists? output_dir
Dir.mkdir output_dir
Dir.chdir output_dir do
  commands = [
              %W[git init],
              %W[touch #{output_file}],
              %W[git commit -am \"Initial commit\"],
             ]


  commands.each do |command|
    system *command
  end

  start_time = Time.now
  1.upto(10) do
    sleep 0.1
    system "echo '#{ Time.now - start_time }' >> #{output_file}"
    system "git add --all"
    command = %W[git commit -m \"#{ Time.now - start_time }\"]
    system *command
  end

end
