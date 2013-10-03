require 'reli'

def fixture(filename)
  File.read(File.expand_path("../fixtures/#{filename}", __FILE__)).chomp
end

def hello_world(language)
  fixture("hello_world/#{language}")
end
