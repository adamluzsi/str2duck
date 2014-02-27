#encoding: UTF-8
module Str2Duck

  def self.parse string_data_obj
    
    begin
      if string_data_obj == string_data_obj.to_f.to_s
        return string_data_obj.to_f
      end
    rescue NoMethodError
    end

    begin
      if string_data_obj == string_data_obj.to_i.to_s
        return string_data_obj.to_i
      end
    rescue NoMethodError
    end

    begin
      if string_data_obj.gsub(":","") == string_data_obj.to_datetime.to_s.gsub(
          "T"," ").gsub("+"," +").gsub(":","")
        return string_data_obj.to_datetime
      end
    rescue Exception
    end

    begin
      if string_data_obj == string_data_obj.to_datetime.to_s
        return string_data_obj.to_datetime
      end
    rescue Exception
    end

    begin
      if string_data_obj == string_data_obj.to_date.to_s
        return string_data_obj.to_date
      end
    rescue Exception
    end

    begin
      if string_data_obj == "true"
        return true
      end
    rescue NoMethodError
    end


    begin
      if string_data_obj == "false"
        return false
      end
    rescue NoMethodError
    end

    begin
      string_input= string_data_obj
      contain= nil
      ["[", "]","^","$","*","/"].each do |one_sym|
        if string_input.include? one_sym
          contain ||= true
        end
      end
      if contain == true
        string_regexp= Regexp.new(string_input).inspect#.gsub('\\','')
        string_regexp= string_regexp[1..(string_regexp.length-2)]
        if string_input == string_regexp
          return Regexp.new(string_input)
        else
          raise ArgumentError,"invalid input string"
        end
      end
    rescue ArgumentError
    end

    begin
      if string_data_obj == string_data_obj.to_s.to_s
        return string_data_obj.to_s
      end
    rescue NoMethodError
    end
    
  end

end
