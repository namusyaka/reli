require 'reli/brainfuck'
require 'reli/ook'
require 'reli/monamona'

module RELI
  def self.new(options = {})
    type = options.delete(:type) || :brainfuck
    self[type].new(options)
  end

  def self.[](key)
    self.const_get(key.capitalize)
  end
end
