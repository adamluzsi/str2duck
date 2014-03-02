#encoding: UTF-8
module Str2Duck
  module Config

    ::Str2Duck::Format.singleton_methods.each do |method|

      self.define_singleton_method "#{method}=" do |boolean|
        unless !!boolean == boolean
          raise( ArgumentError,"invalid value given #{boolean.inspect},input must be a boolean!" )
        end
        self.class_variable_set("@@#{method.to_s}",boolean)
      end

      self.define_singleton_method(method) do
        self.class_variable_get("@@#{method.to_s}")
      end

      self.class_variable_set("@@#{method.to_s}",true)

    end

    def self.list
      ::Str2Duck::Format.singleton_methods
    end

  end
end
