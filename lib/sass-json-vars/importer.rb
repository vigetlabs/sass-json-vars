require 'sass'
require 'json'

class SassJSONVars::Importer < Sass::Importers::Filesystem

  def watched_file?(uri)
    uri =~ /\.json$/ &&
      uri.start_with?(root + File::SEPARATOR)
  end

  protected

  def extensions
    {'json' => :scss}
  end

  def json?(name)
    File.extname(name) == '.json'
  end

  private

  def _find(dir, name, options)
    return unless json? name

    full_filename, syntax = Sass::Util.destructure(find_real_file(dir, name, options))
    return unless full_filename && File.readable?(full_filename)

    json      = JSON.parse(IO.read(full_filename))
    variables = json.map { |key, value| "$#{key}: #{_convert_to_sass(value)}" }.join("\n")

    Sass::Engine.new(variables)
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
