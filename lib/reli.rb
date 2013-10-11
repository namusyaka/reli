require 'reli/brainfuck'
require 'reli/braincrash'
require 'reli/ook'
require 'reli/monamona'
require 'reli/malbolge'

module RELI
  def self.new(options = {})
    type = options.delete(:type) || :brainfuck
    self[type].new(options)
  end

  def self.[](key)
    self.const_get(key.capitalize)
  end
end
