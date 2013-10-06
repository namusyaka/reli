require File.expand_path("../lib/reli/version", __FILE__)

Gem::Specification.new "reli", RELI::VERSION do |s|
  s.summary     = "RELI (Ruby Esoteric Language Implementation)"
  s.description = "Generic interface for Esoteric Language Implementations which is written in Ruby."
  s.authors     = %w(namusyaka pixie-grasper)
  s.email       = "namusyaka@gmail.com"
  s.homepage    = "https://github.com/namusyaka/reli"
  s.files       = `git ls-files`.split("\n") - %w(.gitignore)
  s.test_files  = s.files.select { |path| path =~ /^spec\/.*_spec\.rb/ }
  s.license     = "MIT"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end


