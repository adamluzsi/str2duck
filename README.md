str2duck
========

String(any object) to Duck type parser
It can parse int, float, time, date . datetime, booleans ,json, yaml etc from string

The main Goal for this project to give flexibility when you work on REST protocol where,
most of the obj will be sent as string.

With this you can do simeple validations like
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

it is possible ot extend the Duck flexibility be require the Active Supports time extension,

simple like that:

```ruby
  require File.join 'active_support','time'
```

This will give you even more flexibility in terms of use :)
like:

```ruby

  "Fri, 25 Jan 2013 20:02:15 +0100".duck    #> DateTime obj
  "Sun, 28 Aug 2005".duck                   #> Date obj

```

If you dont want one or more parser to be active on parse, you can simply config th str2duck parser like this

```ruby

  # This will turn of yaml string parsing for example.
  # From this point parsing will not check for yaml but return a string instead if none match
  Str2Duck::Config.yaml = false

  # This will return the implemented parsers, so you dont have to bingo
  puts Str2Duck::Config.list

```

Now it has a new object syntax sugar patch that allow you to call the duck methods on any class if you not sure,
is the obj there is instance of anything but String or not
```ruby
    puts 123.duck.class
    #Fixnum

    puts ["hello","world"].duck.class
    #Array

    puts '{"hello":"world"}'.duck.class
    #Hash

    puts "hello: world".duck.class
    #Hash
```

Happy parsing!
