require 'test/unit'
require 'sass'
require 'sass-json-vars'

class SassJSONVarsTest < Test::Unit::TestCase
  def test_can_convert_arrays_to_lists
    flattened = SassJSONVars::Importer.convert_to_sass(['#c33', '#33c'])
    assert_equal '(#c33,#33c)', flattened
  end

  def test_can_convert_nested_arrays_to_lists
    flattened = SassJSONVars::Importer.convert_to_sass([['#c33', 'red'], '#33c'])
    assert_equal '((#c33,red),#33c)', flattened
  end

  def test_can_convert_hashes_to_maps
    flattened = SassJSONVars::Importer.convert_to_sass({ red: '#c33' })
    assert_equal '(red:#c33)', flattened
  end

  def test_can_convert_nested_hashes_to_maps
    flattened = SassJSONVars::Importer.convert_to_sass({ colors: { red: '#c33' } })
    assert_equal '(colors:(red:#c33))', flattened
  end

  def test_can_convert_complicated_objects
    flattened = SassJSONVars::Importer.convert_to_sass({ colors: ['red', 'blue', 'green'] })
    assert_equal '(colors:(red,blue,green))', flattened
  end

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
