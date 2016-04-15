class A
  @@a = 1
  def self.m
    @@a
  end
end


class B<A
  @@a=2
end

class C<A
  @@a=3
end

puts A.m
puts B.m
puts C.m