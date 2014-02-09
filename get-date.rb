places = Dir.glob('/home/jack/programming/**/.git').select {|f| File.directory? f}
times = []
places.each { |place|
  x = `git --git-dir #{place} log -1 --pretty=format:"%at"`
  t = Time.at(x.to_i)
  times.push(t)
}
times.sort().collect {|x| puts x.to_s}

