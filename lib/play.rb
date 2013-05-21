require 'fileutils'

initial_dir = Dir.pwd
output_dir = "/home/fedex/code/sandbox/recording"
output_file = "output.txt"
old_stdout = STDOUT
STDOUT = ""

def commits
  $out ||= `git log --pretty=oneline --all`
  $out.scan(/^(.+) \"(.+)\"/).reverse
end

Dir.chdir output_dir do
  system "git checkout #{commits.first} > /dev/null"

  commits.each do |commit_hash, time|
    system "git checkout #{commit_hash} > /dev/null"

    start_time = Time.now
    sleep 0.01 while (Time.now - start_time) < time.to_f
    system "clear"
    puts `cat #{output_file}`
  end

end

STDOUT = old_stdout
