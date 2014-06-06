require 'test/unit'
require 'sass'
require 'sass-json-vars'

class SassJSONVarsTest < Test::Unit::TestCase

  def test_can_flatten_hashes
    flattened = SassJSONVars.flat_hash({
      :color => { :red => "#c33" }
    })
    assert_match '#c33', flattened['color-red']
  end

  def test_importability
    scss = Sass.compile_file("test/fixtures/full_path.scss")
    assert_equal "body {\n  color: #cc3333; }\n", scss
  end

end
