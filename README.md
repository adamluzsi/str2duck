str2duck
========

String to Duck type parser
It can parse int, float, time, date . datetime, booleans etc from string

Possible bug source, not yet been tested is the american time format.

```ruby

  require 'str2duck'

  "2011-03-12".duck                 #> Date obj
  "false".duck                      #> False obj
  "123".duck                        #> Integer obj
  "123.123".duck                    #> Float obj
  "2012-09-12T14:49:50+02:00".duck  #> Time obj

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

Happy parsing!


### TODO
                       use safe yaml parsing

