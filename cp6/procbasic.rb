def debug_only(param=nil, &block)
  puts "#{param.class}"
  puts "#{block.class}" if block_given?
end

debug_only {}
puts '--'
p = Proc.new{|x|puts "#{x}"}
debug_only(p)
puts '--'
debug_only(&p)

#Proc.new =proc

=begin
    p.call 'x'
p.yield 'x'
p.('x')
p['x']
=end