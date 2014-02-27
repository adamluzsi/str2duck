#begin
#  string_input= string_data_obj
#  contain= nil
#  ["[", "]","^","$","*","/"].each do |one_sym|
#    if string_input.include? one_sym
#      contain ||= true
#    end
#  end
#  if contain == true
#    string_regexp= Regexp.new(string_input).inspect#.gsub('\\','')
#    string_regexp= string_regexp[1..(string_regexp.length-2)]
#    if string_input == string_regexp
#      return Regexp.new(string_input)
#    else
#      raise ArgumentError,"invalid input string"
#    end
#  end
#rescue ArgumentError
#end
