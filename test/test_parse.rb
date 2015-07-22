$LOAD_PATH.unshift(File.join(__dir__,'..','lib'))
require "str2duck"
require 'minitest/autorun'
describe 'StringParse' do

  specify 'parse objects into the right format' do

    {
        "2011-03-12"                =>  Date,
        "2007-07-20 18:59:27 +0200" =>  Time,
        "2010-10-30 18:02:56 +0200" =>  Time,
        "2012-09-12T14:49:50+02:00" =>  DateTime,
        "123"                       =>  Fixnum,
        "asd"                       =>  String,
        "123.432"                   =>  Float,
        "123,432"                   =>  Float,
        "true"                      =>  TrueClass,
        "false"                     =>  FalseClass,
        "some string data"          =>  String,
        "{\"hello\":\"json\"}"      =>  Hash,
        "--- hello\n..."            =>  String,
        "hello: yaml"               =>  Hash,
        "2014-11-04T15:46:06Z"      =>  DateTime
    }.each_pair do |str,klass|
      str.to_duck.must_be_instance_of klass
    end

  end

end

