$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sass-json-vars/version"

# Describe your gem and declare its dependencies
Gem::Specification.new do |s|
  s.name        = 'sass-json-vars'
  s.version     = SassJSONVars::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nate Hunzaker"]
  s.email       = ['nate.hunzaker@viget.com']
  s.homepage    = 'https://github.com/vigetlabs/sass-json-vars'
  s.summary     = "Allows the use of JSON to declare variables with @import 'file.json'."
  s.description = "Allows the use of JSON to declare variables with @import 'file.json'."
  s.license     = 'MIT'

  s.files       = Dir['lib/**/*', 'Rakefile', 'readme.md']
  s.test_files  = Dir['test/**/*']

  s.add_runtime_dependency 'sass', '>= 3.1'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'coveralls'
end
