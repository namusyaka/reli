# RELI (Ruby Esoteric Language Implementation)

[![Build Status](https://travis-ci.org/namusyaka/reli.png)](https://travis-ci.org/namusyaka/reli)

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

`type:` support `:brainfuck`, and `:ook`, `:monamona`, and `:malbolge`.

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

mona   = RELI::Monamona.new
source = "NNNNNNNNNNnMNNNNNNNMNNNNNNNNNNMNNNMNOOOOAaMNNoMNoNNNNNNNooNNNoMNNoOONNNNNNNNNNNNNNNoMoNNNoAAAAAAoAAAAAAAAoMNo"
mona.run(source) #=> Hello World!
```

### Malbolge

```ruby
require 'reli/malbolge'

malbolge = RELI::Malbolge.new
source   = "(=<`#9]~6ZY32V6/S3,Pq)M'&Jk#Gh~De{z@>`v*;yKw%ut4Uqp0/ml>jibgIedFFaZB^{@[ZfXWV98Mqpo31kj.DCgT"
malbolge.run(source) #=> Hello World!
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

## Authors

* namusyaka
* pixie-grasper

## License

the MIT License
