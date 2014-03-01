require_relative "../lib/str2duck"

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
  "{\"hello\":\"world\"}",
  "--- hello\n..."
].each do |object|
  puts object.duck,object.duck.class,""
end

begin

  require File.join 'active_support','time'

  puts "but if you load the Active support gem like when you do anyway in Rails, the duck will be more with time formats flexible"

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
      "some string data"
  ].each do |object|
    puts object.duck,object.duck.class,""
  end

  puts "Sun, 28 Aug 2005".duck.class
  puts "Fri, 25 Jan 2013 20:02:15 +0100".duck.class

rescue LoadError
end
