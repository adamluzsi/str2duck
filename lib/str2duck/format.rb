#encoding: UTF-8
require 'yaml'
require 'json'

module Str2Duck
  module Format
    class << self

      def datetime obj
        if Str2Duck::Regexp.datetime?(obj)
          if defined?(DateTime) && DateTime.respond_to?(:parse)
            return DateTime.parse obj
          else
            if time_parts.count == 8
              2.times{time_parts.pop}
            elsif time_parts.count == 6
              return nil
            end
            return Time.new(*time_parts)
          end
        end;nil
      end

      def date obj
        if Str2Duck::Regexp.date?(obj)
          begin
            return Date.parse obj
          rescue NoMethodError
            time_parts= obj.scan(/\d+/).map(&:to_i)
            return Time.new(*time_parts)
          end
        end;nil
      end

      def time obj
        if Str2Duck::Regexp.time?(obj)
          begin
            return Time.parse obj
          rescue NoMethodError
            time_parts= obj.scan(/\d+/).map(&:to_i)
            1.times{time_parts.pop}
            return Time.new(*time_parts)
          end
        end;nil
      end

      def true obj
        if Str2Duck::Regexp.true?(obj)
          return true
        end;nil
      end

      def false obj
        if Str2Duck::Regexp.false?(obj)
          return false
        end;nil
      end

      def float obj
        if Str2Duck::Regexp.float?(obj)
          return obj.sub(',','.').to_f
        end;nil
      end

      def integer obj
        if Str2Duck::Regexp.integer?(obj)
          return obj.to_i
        end;nil
      end

      def json obj
        if Str2Duck::Regexp.json?(obj)
          return JSON.parse(obj)
        end;nil
      end

      # damn, this thing eats almost everything...
      def yaml obj
        if Str2Duck::Regexp.yaml?(obj)
          if YAML.respond_to?(:safe_load)
            return YAML.safe_load(obj)
          else
            return YAML.load(obj)
          end
        end;nil
      end

    end
  end
end
