require 'test/unit'
require 'sass'
require 'sass-json-vars'

class SassJSONVarsTest < Test::Unit::TestCase
   def test_strings
    scss = Sass.compile_file("test/fixtures/strings/style.scss")
    assert_equal "body {\n  color: #cc3333; }\n", scss
  end

  def test_lists
    scss = Sass.compile_file("test/fixtures/lists/style.scss")
    assert_equal "body {\n  color: #cc3333; }\n", scss
  end

  def test_maps
    scss = Sass.compile_file("test/fixtures/maps/style.scss")
    assert_equal "body {\n  color: #cc3333; }\n", scss
  end
end
