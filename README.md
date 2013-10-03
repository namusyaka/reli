# RELI (Ruby Esoteric Language Implementation)

Generic interface for Esoteric Language Implementations which is written in Ruby.

## Installation

Add this line to your Gemfile.

`gem 'reli'`

Then execute.

`$ bundle`

Or execute this.

`$ gem install reli`

## Usage

### Basic

`type:` support `:brainfuck`, `:ook`, and `:monamona`.

```ruby
require 'reli'

brainfuck = RELI.new(type: :brainfuck)
source    = "+++++++++[>++++++++<-]>.<++++[>+++++++<-]>+.+++++++..+++.<++++++++[>----------<-]>+.<+++++++[>++++++++<-]>-.<+++++[>+++++<-]>-.+++.------.--------.<++++++++[>--------<-]>---."
brainfuck.run(source) #=> Hello World!
```

### only Brainf*ck

```ruby
require 'reli/brainfuck'

brainfuck = RELI::Brainfuck.new
source    = "+++++++++[>++++++++<-]>.<++++[>+++++++<-]>+.+++++++..+++.<++++++++[>----------<-]>+.<+++++++[>++++++++<-]>-.<+++++[>+++++<-]>-.+++.------.--------.<++++++++[>--------<-]>---."
brainfuck.run(source) #=> Hello World!
```

### Ook!

```ruby
require 'reli/ook'

ook    = RELI::Ook.new
source = <<OOK
Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook! Ook? Ook. Ook?
Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
Ook. Ook. Ook. Ook? Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
Ook. Ook? Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook? Ook. Ook.
Ook? Ook. Ook? Ook. Ook? Ook. Ook? Ook. Ook! Ook! Ook? Ook!
Ook. Ook? Ook. Ook. Ook. Ook. Ook! Ook. Ook. Ook? Ook. Ook.
Ook! Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
Ook. Ook. Ook. Ook. Ook! Ook. Ook! Ook. Ook. Ook. Ook. Ook.
Ook. Ook. Ook! Ook. Ook. Ook? Ook. Ook. Ook. Ook. Ook! Ook.
Ook? Ook. Ook? Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook! Ook.
Ook. Ook? Ook! Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook! Ook.
Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook!
Ook! Ook. Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook!
Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook. Ook. Ook? Ook. Ook.
Ook! Ook. Ook. Ook? Ook! Ook.
OOK
ook.run(source) #=> Hello World!
```

### MONAmona

```ruby
require 'reli/monamona'

mona   = RELI::MONAmona.new
source = "NNNNNNNNNNnMNNNNNNNMNNNNNNNNNNMNNNMNOOOOAaMNNoMNoNNNNNNNooNNNoMNNoOONNNNNNNNNNNNNNNoMoNNNoAAAAAAoAAAAAAAAoMNo"
mona.run(source) #=> Hello World!
```

## TODO

* support other esoteric languages
* RSpec test is insufficient.

## Contributing

1. fork the project.
2. create your feature branch. (`git checkout -b my-feature`)
3. commit your changes. (`git commit -am 'commit message'`)
4. push to the branch. (`git push origin my-feature`
5. send pull request.

## License

the MIT License
