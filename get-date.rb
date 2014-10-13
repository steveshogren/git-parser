require 'date'

def print_date(y)
  puts "--date=\"" + y.to_datetime.next_day().iso8601 + "\""
end
def offsetDate(d)
  offset = rand(180*60) - (60*60)
  y = d + offset
  if y.day != d.day then
    y = d - offset
  end
  return y
end

place = ARGV[0] || "/home/jack/programming/"
location = File.join(place, '/**/.git')
places = Dir.glob(location).select {|f| File.directory? f}
times = []
places.each { |place|
  x = `git --git-dir #{place} log -1 --pretty=format:"%at"`
  t = Time.at(x.to_i)
  times.push(t)
}
x = times.sort().last

print_date(offsetDate(x))
