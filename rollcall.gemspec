Gem::Specification.new do |s|
  s.name        = 'rollcall'
  s.version     = '0.0.1'
  s.date        = '2015-02-02'
  s.summary     = "Roll Call!"
  s.description = "Look for test servers"
  s.authors     = ["Andrew Duane"]
  s.email       = 'andrew.m.duane@gmail.com'
  s.files       = ["lib/rollcall.rb"]
  s.homepage    = "https://github.com/aduane/rollcall"
  s.license     = "MIT"
  s.add_runtime_dependency 'daemons', '1.1.9'
end
