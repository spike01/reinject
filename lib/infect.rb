class Array

  def infect(default = nil)
    memo = default || self.first
    start = (memo == default ? 0 : 1)
    self.slice(start..-1).each { |element| memo = yield(memo, element) }  
    memo
  end

  def reinject(default = nil)
    return 
  end
end

