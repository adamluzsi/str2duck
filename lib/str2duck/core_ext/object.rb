module Str2Duck::CoreExt::Object

  def to_duck
    (self.class <= String) ? Str2Duck.parse(self) : self
  end

  alias :duck :to_duck

end

Object.__send__ :include, Str2Duck::CoreExt::Object