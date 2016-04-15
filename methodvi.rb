class Methodvi
  def pub

  end

  def pri

  end
  private :pri
end

a = Methodvi.new
#a.pri  # not working
a.send :pri  #this works
# private method can be called from subclasses