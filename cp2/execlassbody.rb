def me(mes)
  puts mes
end

res = class M   #self executing
        ans = 10
        puts ans.to_s
        me("hi")
        ans
end

puts res.to_s
puts M.superclass