module Str2Duck

  module MPatch

    module String

      def duck(self_obj= self)
        Str2Duck.parse(self_obj)
      end
      alias :to_duck :duck

      self.instance_methods.each do |symbol|
        module_function symbol
        public symbol
      end

    end

  end

end

String.__send__( :include, Str2Duck::MPatch::String )