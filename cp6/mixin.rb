
module D
  module ClassMethods
    def getd
      #
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def x

  end
end


class Mixin
  include D
end