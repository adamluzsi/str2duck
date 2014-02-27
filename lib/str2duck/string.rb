class String

  def duck
    Str2Duck.parse(self)
  end
  alias :to_duck :duck

end