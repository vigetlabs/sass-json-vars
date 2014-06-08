require 'sass'
require 'json'

class SassJSONVars::Importer < Sass::Importers::Base

  def find(uri, options)
    if File.extname(uri) == '.json'
      self.class.sass_engine(uri, self, options)
    else
      nil
    end
  end

  def find_relative(uri, base, options)
    nil
  end

  def to_s
    self.class.name
  end

  def hash
    self.class.name.hash
  end

  def eql?(other)
    other.class == self.class
  end

  def self.convert_to_sass(item)
    if item.is_a? Array
      '(' + item.map { |i| self.convert_to_sass(i) }.join(',') + ')'
    elsif item.is_a? Hash
      '(' + item.map {|key, value| key.to_s + ':' + self.convert_to_sass(value) }.join(',') + ')'
    else
      item
    end
  end

  def self.sass_engine(uri, importer, options)
    json = JSON.parse(IO.read(uri))

    variables = json.map do |name, value|
      output = self.convert_to_sass(value);

      "$#{name}: #{output}"
    end

    Sass::Engine.new(variables.join("\n"))
  end
end
