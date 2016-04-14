####psrubyfunda
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
