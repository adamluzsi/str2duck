str2duck
========

String to Duck type parser
It can parse int, float, time, date,  datetime, booleans  and even json by guessing the type and using the right parsing metric on the string object.

The main Goal for this project to give flexibility when you working with a protocol like for example: HTTP,
where, most of the obj will be sent as string.

With this you can simple convert string to other objects for any purpose

```ruby

  params['hash_obj_key'].to_duck.class <= Hash
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

It is possible ot extend the Str2Duck flexibility be installing Active Supports for it's time and DateTime extension,
but it is only an extra options and not a dependency!

To use is, all you need to do is add activesupport to the gemfile and require in runtime:

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

    123.to_duck.class #> Fixnum

    ["hello","world"].to_duck.class #> Array

    '{"hello":"world"}'.to_duck.class #> Hash

    '{"hello":"world"}'.to_duck.class #> Hash

```

### Changelog 

* YAML support is dropped due the unpredictable flexible syntax of the yaml
* Config constant no longer available, cause parsing moved from singleton pattern to instance based 

Happy parsing!
