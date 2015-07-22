module Str2Duck::Matcher

  extend self

  def datetime?(obj)

    answer_value= nil
    [
        /^\w+, \d+ \w+ \d+ \d\d:\d\d:\d\d \+\d+$/,
        /^-?\d+-\d\d-\d\d\w\d\d:\d\d:\d\d\+\d\d:\d\d$/,
        /\w+ \w+ \d+ \d+ \d+:\d+:\d+ \w+\+\d+ \(\w+\)/,
        /^-?\d+-\d\d?-\d\d?\w\d\d?:\d\d?:\d\d?\w$/
    ].each do |regexp|
      answer_value ||= obj =~ regexp
    end

    return !!answer_value

  end

  def date?(obj)

    answer_value= nil
    [
        /^\d+-\d\d-\d\d$/,
        /^\w+, \d+ \w+ \d+$/
    ].each do |regexp|
      answer_value ||= obj =~ regexp
    end

    return !!answer_value

  end

  def time?(obj)

    answer_value= nil
    [
        /^\d+-\d\d-\d\d \d\d:\d\d:\d\d \+\d+$/
    ].each do |regexp|
      answer_value ||= obj =~ regexp
    end

    return !!answer_value

  end

  def true?(obj)
    return !!obj =~ /^true$/
  end

  def false?(obj)
    return !!obj =~ /^false$/
  end

  def float?(obj)
    case obj.to_s
      when /^\d+\.\d+$/, /^\d+,\d+$/
        return true
      else
        return false
    end
  end

  def integer?(obj)
    return !!obj =~ /^\d+$/
  end

  def json?(obj)
    return false unless defined?(JSON)
    begin
      JSON.parse(obj)
      return true
    rescue ::JSON::ParserError
      return false
    end
  end

end