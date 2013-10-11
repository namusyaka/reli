$:.unshift(File.dirname(__FILE__))
require 'spec_helper'

module RELI
  describe do
    it "support brainfuck" do
      bf = RELI.new(:type => :brainfuck)
      expect(bf.run(hello_world(:brainfuck))).to eq("Hello World!")
    end

    it "support braincrash" do
      bf = RELI.new(:type => :braincrash)
      expect(bf.run(hello_world(:braincrash))).to eq("Hello World!")
    end

    it "support ook" do
      bf = RELI.new(:type => :ook)
      expect(bf.run(hello_world(:ook))).to eq("Hello World!")
    end

    it "support monamona" do
      bf = RELI.new(:type => :monamona)
      expect(bf.run(hello_world(:monamona))).to eq("Hello World!")
    end

    it "support malbolge" do
      bf = RELI.new(:type => :malbolge)
      expect(bf.run(hello_world(:malbolge))).to eq("Hello World!")
    end

    # HQ9+ never say "Hello World!", instead of "Hello, world!"
    it "support HQ9+" do
      bf = RELI.new(:type => :hq9plus)
      expect(bf.run(hello_world(:hq9plus))).to eq("Hello, world!")
    end
  end
end
