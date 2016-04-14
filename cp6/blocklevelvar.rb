class Blocklevelvar
  def initialize
    @debug = true
    @debug_attrs = {staus: :ok}
  end

  def debug_only
    return nil unless @debug
    return nil unless block_given?
    puts "Run this code"
    yield @debug_attrs
  end

  def locate_block
    attrs = {a:1}
    debug_only do |attrs|           #If change name from attrs to xxxx, it will change attrs in inner scope
      attrs[:b]=2                   # this arg shadow same name var from outer scope
    end
    p attrs                          #{:a=>1}
    p @debug_attrs                # {:staus=>:ok, :b=>2}
  end


end

k = Blocklevelvar.new
k.locate_block