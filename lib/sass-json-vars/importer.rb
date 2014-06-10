require 'sass'
require 'json'

class SassJSONVars::Importer < Sass::Importers::Filesystem

  def watched_file?(uri)
    uri =~ /\.json$/ && uri.start_with?(root + File::SEPARATOR)
  end

  def extensions
    {'json' => :scss}
  end

  def json?(name)
    File.extname(name) == '.json'
  end

  def find(name, options)
    super(name, options) if json? name
  end

  def find_relative(name, base, options)
    super(name, base, options) if json? name
  end

  def sass_engine(uri, options)
    json = JSON.parse(IO.read(uri))

    variables = json.map do |name, value|
      output = _convert_to_sass(value);
      "$#{name}: #{output}"
    end

    Sass::Engine.new(variables.join("\n"))
  end

  private

  def _find(dir, name, options)
    full_filename, syntax = Sass::Util.destructure(find_real_file(dir, name, options))
    return unless full_filename && File.readable?(full_filename)

    options[:syntax] = syntax
    options[:filename] = full_filename
    options[:importer] = self

    sass_engine(full_filename, options)
  end

  def _convert_to_sass(item)
    if item.is_a? Array
      _make_list(item)
    elsif item.is_a? Hash
      _make_map(item)
    else
      item
    end
  end

  def _make_list(item)
    '(' + item.map { |i| _convert_to_sass(i) }.join(',') + ')'
  end

  def _make_map(item)
    '(' + item.map {|key, value| key.to_s + ':' + _convert_to_sass(value) }.join(',') + ')'
  end

end
