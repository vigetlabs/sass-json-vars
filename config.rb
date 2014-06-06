require 'sass'
require './sass-json'

Sass.load_paths << SpriteImporter.new()

puts Sass.compile_file('test.scss');
