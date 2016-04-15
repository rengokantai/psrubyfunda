class Operator
  attr_reader :name
  attr_reader :speed

  def initialize(name)
    @name = name
    @speed = 0
    @c =[]
    @v = Hash.new{[]}
  end

  def [](type)
    @v[type]
  end


  def []=(type,ve)
    @v[type]=ve
  end

  def <<  (c)
    @c<<c
  end


  def <=> (other)
    name <=>other.name
  end

  def +@
    @speed+=10
  end
  def -@
    @speed-=10
  end

  def !
    puts "destruct"
  end
end

s = Operator.new("name")
class N;end
s[:sym]=[N.new,N.new]
puts "#{s[:sym].inspect}"

class C;end
ci = C.new
s << ci
p s

r = Operator.new("m")
t= Operator.new("a")
p [s,r,t].sort.map{|s|s.name}

+r
puts "#{r.speed}"
-r
puts "#{r.speed}"

!r