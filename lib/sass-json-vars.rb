module SassJSONVars; end

require 'sass-json-vars/importer';

Sass.load_paths << SassJSONVars::Importer.new()
