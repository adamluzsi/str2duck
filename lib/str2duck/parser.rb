class Str2Duck::Parser

  DEFAULT_STRATEGIES = [:datetime, :date, :time, :true, :false, :float, :integer, :json].freeze

  def initialize(*parse_strategies)

    @parse_strategies = parse_strategies.map(&:to_s).map(&:to_sym)
    @parse_strategies.push(*DEFAULT_STRATEGIES) if @parse_strategies.empty?

    require_activesupport

  end

  def parse(str)

    raise(ArgumentError, 'invalid input, must be string like') unless str.class <= String

    @parse_strategies.each do |method_name|
      var = Str2Duck::Converter.public_send(method_name, str)
      return var unless var.nil?
    end

    return str

  end

  protected

  def require_activesupport
    require(File.join 'active_support', 'time') unless @activesupport_required
  rescue LoadError
  ensure
    @activesupport_required = true
  end

end