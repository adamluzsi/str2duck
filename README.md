str2duck
========

String(any object) to Duck type parser
It can parse int, float, time, date . datetime, booleans ,json, yaml etc from string

The main Goal for this project to give flexibility when you work on REST protocol where,
most of the obj will be sent as string.

With this you can do simeple validations in Grape like this (or anywhere)
```ruby

  params['hash_obj_key'].duck.class <= Hash
```

Possible bug source, not yet been tested is the american time format.

```ruby

  require 'str2duck'

  "2011-03-12".duck                 #> Date obj
  "false".to_duck                      #> False obj
  "123".duck                        #> Integer obj
  "123.123".duck                    #> Float obj
  "2012-09-12T14:49:50+02:00".duck  #> Time obj

  # without sugar syntax, you can use this
  Str2Duck.parse("123.123")         #> Float obj
```

it is possible ot extend the Duck flexibility be installing Active Supports for it's time extension,

simple like this in Gemfile:

```ruby
  gem 'activesupport'
```

This will give you even more flexibility in terms of use :)
like:

```ruby

  "Fri, 25 Jan 2013 20:02:15 +0100".duck    #> DateTime obj
  "Sun, 28 Aug 2005".duck                   #> Date obj

```

If you dont want one or more parser to be active on parse, pass the strategie names you want to be used on parsing

```ruby

  Str2Duck.parse('string',:datetime,:date)
  
```

You can access duck parsing from object methods simple as:
```ruby

    puts 123.to_duck.class #> Fixnum

    puts ["hello","world"].to_duck.class #> Array

    puts '{"hello":"world"}'.to_duck.class #> Hash

    puts "hello: world".to_duck.class #> Hash

```

Happy parsing!
