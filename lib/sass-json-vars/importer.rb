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

  def self.flat_hash(h, f=[], g={})
    return g.update({ f.join('-') => h }) unless h.is_a? Hash
    h.each { |k,r| flat_hash(r,f+[k],g) }
    g
  end

  # Returns a Sass::Engine for this sprite object
  def self.sass_engine(uri, importer, options)
    flattened = self.flat_hash JSON.parse(IO.read(uri))

    variables = flattened.map do |name, value|
      "$#{name}: #{value}"
    end

    Sass::Engine.new(variables.join("\n"))
  end
end
