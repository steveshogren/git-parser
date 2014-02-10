require 'date'

def print_date(y)
  puts "--date=\"" + y.to_datetime.next_day().iso8601 + "\""
end

location = File.join(ARGV[0], '/**/.git')
places = Dir.glob(location).select {|f| File.directory? f}
times = []
places.each { |place|
  x = `git --git-dir #{place} log -1 --pretty=format:"%at"`
  t = Time.at(x.to_i)
  times.push(t)
}
x = times.sort().last
offset = rand(180*60) - (60*60)
y = x + offset
if y.day == x.day then
  print_date(y)
else 
  y = x - offset
  print_date(y)
end

