module Str2Duck

  module MPatch

    module Object

      def duck(self_obj= self)
        if self_obj.class <= String
          Str2Duck::MPatch::String.duck(self_obj)
        else
          return self_obj
        end
      end

      alias :to_duck :duck

      self.instance_methods.each do |symbol|
        module_function symbol
        public symbol
      end

    end

  end

end

Object.__send__( :include, Str2Duck::MPatch::Object )