require_relative "../lib/str2duck"

puts 123.duck.class
puts ["hello","world"].duck.class
puts '{"hello":"world"}'.duck.class
puts "hello: world".duck.class,"","---"


Str2Duck::Config.yaml = false
puts Str2Duck::Config.list,"","---"
puts "hello: world".duck.class