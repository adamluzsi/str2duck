#encoding: UTF-8
module Str2Duck

  def self.activesupport
    require File.join 'active_support','time'
  rescue LoadError
    return false
  end

  def self.parse str
    raise(ArgumentError,"invalid input, must be string like") unless str.class <= String

    @@activesupport ||= activesupport

    var= nil
    [ :datetime, :date, :time, :true, :false, :float, :integer, :json, :yaml ].each do |method_name|
      if ::Str2Duck::Config.__send__(method_name)
        var= Str2Duck::Format.__send__ method_name, str
        return var unless var.nil?
      end
    end

    return str

  end

end
