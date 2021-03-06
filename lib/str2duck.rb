module Str2Duck

  require 'str2duck/matcher'
  require 'str2duck/converter'
  require 'str2duck/parser'

  require 'str2duck/core_ext'

  def self.parse(str,*parse_strategies)
    self::Parser.new(*parse_strategies).parse(str)
  end

end