#encoding: UTF-8
module Str2Duck

  def self.parse string_data_obj
    raise ArgumentError,"invalid input, must be string!" if string_data_obj.class != String
    return_value= nil

    Str2Duck::Format.singleton_methods.each do |method_name|
      return_value ||= Str2Duck::Format.__send__ method_name, string_data_obj
    end

    return_value ||= string_data_obj
    return return_value
  end

end
