class String
  def sp
    chars.join(" ")
  end

  alias_method "orsize", "size"

  def size
    orsize *2-1
  end
end

puts "abc".size