require 'test_helper'
require 'test/unit'
require 'sass'
require 'sass-json-vars'

class SassJSONVarsImporterTest < Test::Unit::TestCase
  def test_unwatched_non_json_file
    unwatched_file = make_path(root, 'style.scss')
    assert_equal false, importer.watched_file?(unwatched_file)
  end

  def test_unwatched_non_root_file
    unwatched_file = make_path([File.dirname(__FILE__)], 'fixtures', 'maps', 'variables.json')
    assert_equal false, importer.watched_file?(unwatched_file)
  end

  def test_watched_file
    watched_file = make_path(root, 'variables.json')
    assert_equal true, importer.watched_file?(watched_file)
  end

  private

  def importer
    @importer ||= SassJSONVars::Importer.new(root)
  end

  def root
    make_path [File.dirname(__FILE__)], 'fixtures', 'strings'
  end

  def make_path(*path_components)
    path_components.join(File::SEPARATOR)
  end
end
