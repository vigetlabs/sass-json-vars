# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sass-json-vars/version"

Gem::Specification.new do |s|
  s.name        = 'sass-json-vars'
  s.version     = Sass::JSONVars::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nate Hunzaker"]
  s.email       = 'nate.hunzaker@viget.com'
  s.homepage    = 'https://github.com/vigetlabs/sass-json-vars'
  s.summary     = "Allows the use of JSON to declare variables with @import 'file.json'."
  s.description = "Allows the use of JSON to declare variables with @import 'file.json'."
  s.license     = 'MIT'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'sass', '>= 3.1'
end
