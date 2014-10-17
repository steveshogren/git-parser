task :default => [:latest]

task :latest do
  puts `ruby /home/jack/programming/date-parser/get-date.rb`
end

task :pusher do
  place = "/home/jack/programming/"
  location = File.join(place, '/**/.git')
  places = Dir.glob(location).select {|f| File.directory? f}
  now = Time.now
  two_weeks_ago = now - (2*7*24*60*60)
  places.each { |place|
    x = `git --git-dir #{place} log -1 --pretty=format:"%at"`
    last_commit = Time.at(x.to_i)
    if two_weeks_ago < last_commit then
      puts place + `git --git-dir=#{place} push`
    else 
      puts place
      puts last_commit.to_s +  " - was too long ago to care"
    end
  }

end
