class Parallel
  def self.next_id
    @nextid||=0
    @nextid+=1
  end

  def initialize(size)
    @name = "#{Parallel.next_id}"
    @type = :regular
    @size = size
  end

  def to_a
    instance_variables.map{|v| instance_variable_get(v)}
  end
end

p [Parallel.new(:a)]
p [*Parallel.new(:a)]    # this implements #a
