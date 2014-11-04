#encoding: UTF-8
module Str2Duck
  module Regexp

    @@year  = '\d+'
    class << self

      def datetime? obj

        answer_value= nil
        [
            /^\w+, \d+ \w+ #{@@year} \d\d:\d\d:\d\d \+\d+$/,
            /^-?#{@@year}-\d\d-\d\d\w\d\d:\d\d:\d\d\+\d\d:\d\d$/,
            /\w+ \w+ \d+ #{@@year} \d+:\d+:\d+ \w+\+\d+ \(\w+\)/,
            /^-?\d+-\d\d?-\d\d?\w\d\d?:\d\d?:\d\d?\w$/
        ].each do |regexp|
          answer_value ||= obj =~ regexp
        end

        return !!answer_value

      end

      def date? obj

        answer_value= nil
        [
            /^#{@@year}-\d\d-\d\d$/,
            /^\w+, \d+ \w+ #{@@year}$/
        ].each do |regexp|
          answer_value ||= obj =~ regexp
        end

        return !!answer_value

      end

      def time? obj

        answer_value= nil
        [
            /^#{@@year}-\d\d-\d\d \d\d:\d\d:\d\d \+\d+$/
        ].each do |regexp|
          answer_value ||= obj =~ regexp
        end

        return !!answer_value

      end

      def true? obj
        return !!obj =~ /^true$/
      end

      def false? obj
        return !!obj =~ /^false$/
      end

      def float? obj
        case obj.to_s
          when /^\d+\.\d+$/,/^\d+,\d+$/
            return true
          else
            return false
        end
      end

      def integer? obj
        return !!obj =~ /^\d+$/
      end

      def json? obj
        begin
          JSON.parse(obj)
          return true
        rescue ::JSON::ParserError
          return false
        end
      end

      def yaml? obj
        YAML.safe_load(obj)
        return true
      rescue ::Exception
        return false
      end

    end
  end
end
