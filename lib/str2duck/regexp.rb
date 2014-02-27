#encoding: UTF-8
module Str2Duck
  module Regexp
    class << self

      def datetime? obj

        answer_value= nil
        [
            /^\w+, \d+ \w+ \d\d\d\d \d\d:\d\d:\d\d \+\d+$/,
            /^\d\d\d\d-\d\d-\d\d\w\d\d:\d\d:\d\d\+\d\d:\d\d$/
        ].each do |regexp|
          answer_value ||= obj =~ regexp
        end

        return Str2Duck.return_value_parse answer_value

      end

      def date? obj

        answer_value= nil
        [
            /^\d\d\d\d-\d\d-\d\d$/,
            /^\w+, \d+ \w+ \d\d\d\d$/
        ].each do |regexp|
          answer_value ||= obj =~ regexp
        end

        return Str2Duck.return_value_parse answer_value

      end

      def time? obj

        answer_value= nil
        [
            /^\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d \+\d+$/
        ].each do |regexp|
          answer_value ||= obj =~ regexp
        end

        return Str2Duck.return_value_parse answer_value

      end

      def true? obj
        return Str2Duck.return_value_parse obj =~ /^true$/
      end

      def false? obj
        return Str2Duck.return_value_parse obj =~ /^true$/
      end

      def float? obj
        return Str2Duck.return_value_parse obj =~ /^\d+\.\d+$/
      end

      def integer? obj
        return Str2Duck.return_value_parse obj =~ /^\d+$/
      end

    end
  end
end
