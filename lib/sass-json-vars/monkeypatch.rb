require 'sass-json-vars/importer'

# Taken from https://github.com/chriseppstein/sass-css-importer/blob/master/lib/sass/css_importer/monkey_patches.rb
# TODO: This feels wrong, surely there must be a better way to handle this

class Sass::Engine
  alias initialize_without_json_importer initialize

  def initialize(template, options={})
    initialize_without_json_importer(template, options)

    json_importer = self.options[:load_paths].find {|lp| lp.is_a?(SassJSONVars::Importer) }

    unless json_importer
      root = File.dirname(options[:filename] || ".")
      self.options[:load_paths] << SassJSONVars::Importer.new(root)
    end
  end
end
