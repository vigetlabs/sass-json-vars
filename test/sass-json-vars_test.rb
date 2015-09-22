require 'test_helper'
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

  def test_booleans
    scss = Sass.compile_file("test/fixtures/booleans/style.scss")
    assert_equal "body {\n  color: blue; }\n", scss
  end

  def test_nesting_booleans
    scss = Sass.compile_file("test/fixtures/nesting/booleans.scss")
    assert_equal "body {\n  color: red; }\n", scss
  end

  def test_nesting_strings
    scss = Sass.compile_file("test/fixtures/nesting/strings.scss")
    assert_equal "body {\n  color: red; }\n", scss
  end

  def test_nesting_numbers
    scss = Sass.compile_file("test/fixtures/nesting/numbers.scss")
    assert_equal "body {\n  padding: 10px; }\n", scss
  end
end
