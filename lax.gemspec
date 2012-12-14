$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'rake'
require 'lax/version'

Gem::Specification.new do |spec|
  spec.name        = 'lax'
  spec.version     = Lax::VERSION
  spec.author      = 'feivel jellyfish'
  spec.email       = 'feivel@sdf.org'
  spec.files       = FileList['lax.gemspec','lib/**/*.rb','README.md','LICENSE']
  spec.test_files  = FileList['rakefile','test/**/*.rb']
  spec.license     = 'MIT/X11'
  spec.homepage    = 'http://github.com/gwentacle/lax'
  spec.summary     = 'An insouciant smidgen of a testing framework.'
  spec.description = 'A lightweight testing framework that is not the boss of you.'
end
