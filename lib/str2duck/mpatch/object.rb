module Str2Duck
  module MPatch
    module ObjectEXT

      def to_duck
        if self_obj.class <= String
          Str2Duck.parse(self)
        else
          return self
        end

      end

      alias :duck :to_duck

    end
  end
end

Object.__send__ :include, Str2Duck::MPatch::ObjectEXT