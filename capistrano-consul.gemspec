require File.expand_path('../lib/capistrano/consul/version.rb', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'capistrano-consul'
  s.version       = Capistrano::Consul::VERSION
  s.date          = "2015-06-23"
  s.description   = "Consul discovery for Capistrano"
  s.summary       = "Consul discovery for Capistrano"
  s.authors       = ["Ryan Graham"]
  s.email         = "ryan.graham@gmail.com"
  s.homepage      = "http://github.com/ryangraham/capistrano-consul"
  s.require_paths = ["lib"]
  s.files         = `git ls-files`.split("\n") 

  s.add_runtime_dependency 'diplomat', '~> 0.13.2'
end
