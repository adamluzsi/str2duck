$LOAD_PATH.unshift(File.join(__dir__,'..','lib'))
require "str2duck"

[
  "2011-03-12",
  "2007-07-20 18:59:27 +0200",
  "2010-10-30 18:02:56 +0200",
  "2012-09-12T14:49:50+02:00",
  "123",
  "asd",
  "123.432",
  "true",
  "false",
  "some string data",
  "{\"hello\":\"json\"}",
  "--- hello\n..." ,
  "hello: yaml"
].each do |object|
  puts object.duck,object.duck.class,""
end

begin

  puts "But if you load the Active support gem like when you do anyway in Rails,",
       "-> the parser will be more flexible in the time formats"

  [
      "2011-03-12",
      "2007-07-20 18:59:27 +0100",
      "2010-10-30 18:02:56 +0200",
      "2012-09-12T14:49:50+02:00",
      "123",
      "asd",
      "123.432",
      "true",
      "false",
      "some string data",
      "Sun, 28 Aug 2005",
      "Fri, 25 Jan 2013 20:02:15 +0100"

  ].each do |object|
    puts object.duck,object.duck.class,""
  end

rescue LoadError
end
