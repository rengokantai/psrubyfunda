####psrubyfunda
#####classes and objects
######objects
most things in ruby are objects, variables are not, var is label for objects so all are refer to same object
```
a="a"
b=a
a="x"
b   #x
a.object_id=b.object_id
```
create a real clone.
```
b=a.clone()
```
######class methods
@@.cannot access outside the class
######visibility
protected method can be called on another object by an object of same class or an objectwith same ancestor if the method was defined in that ancestor
######equality
```
a=b=1
a.equal?(b)  # true
a=1
b=1
a.equal?(b)  #false
a==b  #true
```
```
a=Class.new()
b=Class.new()
a.equal?(b)  #false
a.name==b.name #true
```
override equal method
```
def ==(other)
    name==other.name
end
```
So
```
a==b #true
```

#####flow control
######looping
```
10.upto(20)
20.downto(10)
2.times
1.step(10,2)
```
######controlling
```
while message = x
    next if message.type = ..  #jump to next loop
end
```
redo
```
while message = x
    redo if message.type = ..  #jump to next loop
end
```
######Handling excepions
```
def x
    begin
        functionthrow
    rescue
        return false
    end
end
```

```
def x
    begin
        functionthrow
    rescue StandardError=>e
        puts e.message
        false
    end
end
```
######Raising Exception
Ex:
```
def x
    raise "msg:
end
```
Or using second args
```
def x
    raise Error, "msg:
end
```
Using $!
```
rescue Error=>err
    puts $!.message
    raise
end
```
######retrying and rescue modifier
```
def
    ...
    rescue Error=>e
        retry #(back to beginnning of method)
    end
end
```
rescue modifier
```
method rescue false
```
if method raise error, rescue will kick in
######scopes
in ruby, if,while does not have scope,blocks have
#####Standard type
######boolean
only nil and false are false,others, like empty string,0 are true
######Integer
Fixnum Bignum
Object represent numbers are read only.
```
a=10
def f(n)
    n+=10
end
f(a)  #20
a #10
```
but string and array are mutable
######String
```
%q{'sttring' string}   #this can be any char
\u{20a a3 3a}
```
Or
```
mes = <<EOF
not keep indentation
EOF
```

```
mes = <<-EOF
keep indentation
EOF
```
######string opera
```
"%05d" %123   #00123
"%.8g" %123.123123123   #123.12312
"~ 5\u123.chars  #["~","5","\u123"]
"abc".gsub("a","A")
```
######regex
[test ruby regex](rubular.com)
Two way:
```
/\d+/
%r(\d+)
```
=~ operator
```
/\d+/ =~"abc 4"  #4 (return index)
```

```
m = /(\d+):(\d+)/.match("12:12")   # 0:12:12 1:12 2:13
```
$&: 0  $`:prematch $':postmatch others: $1 $2
```
"12a12".scan(/\d+/)  # 12 12
```
advanced gsub
```
"abc def.gsub(/([a-zA-Z]+) ([a-zA-Z]+)/, "\\2 \\1")   # or  '\2 \1'
```
multiline:
```
s = "pass 123"
s.gsub(/(pass)\s+(\w+)/){|match| "#{$1}"+"*" * $2.length}
```

######symbol
```
:abc.to_s
"abc".to_sym
```
######array
```
Array.new(3)  # nil nil nil
a = Array.new(3,"x")  "x" "x" "x"
a.first.upcase!  "X" "X" "X"   #all changed...
Array.new(3){"x"}  # this time, every object are diff object
```
create array using symbols
```
%w(a b c)  #["a", "b", "c"]
%i(a b c)  #[:a, :b,:c]
```
multiply use seperator
```
[1, 3]*","   #[1,3]
```
######enumerable
```
[1,2,3].reduce(0){|x,y|x+y}
[1,2,3].select{|x|x.even?}
```
two consecutive
```
[1,2,3].each_cons(2){|x|p x}  # [1, 2] [2, 3]
```
######Hash
```
h=Hash.new(0)  #default change to 0, not nil
```
######range
2dot  []
3dot [)

######


#####methods in depth
######varlength
when dealing with predefined
```
def m(a=10, *args)
end

m  #legal
m(10,:a,:b) #legal
m(:a,:b) #illegal ,first param must be explicitly assigned
```

```
arr=[1,2]
met_call(10,*arr)  #same as
met_call(10,1,2)
```
######operators
spaceship: use to sort items
implement binary operator @+ @-
######method calls
same:
```
a.size
a.send(:size)
```



#####More ruby tools
######lambda
```
l = lambda{|a| "#{a}"}
l = ->(a){"#{a}"}
```
proc: return is executed in the scope where the block is defined, break isnot allowed outside a loop
lambda: break and return control to the caller
######using proc and lambda
proc{|a,b|}.arity  #2
proc{|a,*b,c|}.arity  # -3   return non optional args plus 1 then negative
######constant
you cannot define constants in methods
######module
two purposes: namespace, mixin(add func to class)
namespace: mothod in module use self.
```
module X
    module N
        self.method1
        end
    end
end
```
use:
```
X::N.method
```
mixin: tyically only contains instance methods(no self)
```
module M
    method1
    end
end
```
use:
```
class Use
    include M
end

instance = Use.new
instance.method1
```

If two included modules contains same name, last will win out

```
# assume C is B's subclass
class A
    include B
    include C
end
```
#####putting ruby to work
######Testing framework
MiniTest:

```
require 'minitest/autorun'
require_relative ./lib/relativefolder
include relativefloderclass

class TestName < MiniTest::Unit::TestCase
    def setup
        @x = X.new()
    end

    def test_name
        assert(@x.name== "x)
    end

    def test_name
        assert_equal(2,@x.size)
    end
```
######debug
using ruby debug
```
ruby -r debug file.rb
next 1
next 1
p
q
```
