class Array

  def infect(default = nil)
    memo = default || self.first
    start = (memo == default ? 0 : 1)
    self.drop(start).each { |element| memo = yield(memo, element) }  
    memo
  end

  def reinject(default = nil, &block)
    array = self.dup 
    memo = default.nil? ? array.shift : default
    memo = block.call(memo, array.shift)
    return memo if array.empty?
    array.reinject(memo, &block)
  end

# preparing to add symbol handling

  #def infect(default = nil, symb = nil, &block)
    #memo = default || self.first
    #start = (memo == default ? 0 : 1)
    #self.drop(start).each { |element| memo = yield(memo, element) }  
    #memo
  #end

  #def reinject(default = nil, symb = nil, &block)
    #array = self.dup 
    #memo = default.nil? ? array.shift : default
    #memo = yield(memo, array.shift)
    #return memo if array.empty?
    #array.reinject(memo, &block)
  #end


end

# Given an array [1, 2, 3, 4, 5] and a &block { |x, y| x something y}
# And an optional default value
# When we yield the block
# And store it back to memo
# Then we should have a shifted array [2, 3, 4, 5] ready to feed back into the
# method

