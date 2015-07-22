module Str2Duck::Converter

  extend self

  def datetime(obj)
    if Str2Duck::Matcher.datetime?(obj)
      if defined?(DateTime) && DateTime.respond_to?(:parse)
        return DateTime.parse(obj)
      # else
      #   if time_parts.count == 8
      #     2.times { time_parts.pop }
      #   elsif time_parts.count == 6
      #     return nil
      #   end
      #   return Time.new(*time_parts)
      end
    end; nil
  end

  def date(obj)
    if Str2Duck::Matcher.date?(obj)
      begin
        return Date.parse(obj)
      rescue NoMethodError
        time_parts= obj.scan(/\d+/).map(&:to_i)
        return Time.new(*time_parts)
      end
    end; nil
  end

  def time(obj)
    if Str2Duck::Matcher.time?(obj)
      begin
        return Time.parse(obj)
      rescue NoMethodError
        time_parts= obj.scan(/\d+/).map(&:to_i)
        1.times { time_parts.pop }
        return Time.new(*time_parts)
      end
    end; nil
  end

  def true(obj)
    if Str2Duck::Matcher.true?(obj)
      return true
    end; nil
  end

  def false(obj)
    if Str2Duck::Matcher.false?(obj)
      return false
    end; nil
  end

  def float(obj)
    if Str2Duck::Matcher.float?(obj)
      return obj.sub(',', '.').to_f
    end; nil
  end

  def integer(obj)
    if Str2Duck::Matcher.integer?(obj)
      return obj.to_i
    end; nil
  end

  def json(obj)
    if Str2Duck::Matcher.json?(obj)
      return JSON.parse(obj)
    end; nil
  end

end