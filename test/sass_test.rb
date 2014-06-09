require 'test/unit'
require 'sass'
require 'sass-json-vars'

class SassTest < Test::Unit::TestCase
  def test_sass_syntax
    scss = Sass.compile_file("test/fixtures/sass/style.sass")
    assert_equal "body {\n  color: #cc3333; }\n", scss
  end
end
