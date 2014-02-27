#encoding: UTF-8
module Str2Duck
  class << self
    def return_value_parse object
      case object

        when nil
          return false
        when 0
          return true
        else
          nil

      end
    end
  end
end
