class Array

  def infect(default = nil, &block)
    memo = default || self.first
    start = (memo == default ? 0 : 1)
    self.drop(start).each { |element| memo = yield(memo, element) }  
    memo
  end

  def reinject(memo = self.shift, &block)
    array = self.dup 
    self.unshift(memo)
    memo = yield(memo, array.shift)
    return memo if array.empty?
    array.reinject(memo, &block)
  end
end

# Given an array [1, 2, 3, 4, 5] and a &block { |x, y| x something y}
# And an optional default value
# When we yield the block
# And store it back to memo
# When we should have a shifted array [2, 3, 4, 5] ready to feed back into the
# method

