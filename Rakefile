task :default => [:latest]

task :latest do
  puts `ruby /home/jack/programming/date-parser/get-date.rb`
end

task :pusher do
  place = "/home/jack/programming/"
  location = File.join(place, '/**/.git')
  places = Dir.glob(location).select {|f| File.directory? f}
  places.each { |place|
    puts place + `git --git-dir=#{place} push`
  }
end
