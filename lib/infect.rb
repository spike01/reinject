class Array

  def infect(default = nil, symbol = nil)
    return infect(&default) if default.is_a?(Symbol)
    return infect(default, &symbol) if symbol
    memo = default || first
    start = memo == default ? 0 : 1
    drop(start).each { |element| memo = yield(memo, element) }
    memo
  end

  def reinject(default = nil, symbol = nil, &block)
    return reinject(&default) if default.is_a?(Symbol)
    return infect(default, &symbol) if symbol
    array = dup
    memo = default.nil? ? array.shift : default
    memo = block.call(memo, array.shift)
    return memo if array.empty?
    array.reinject(memo, &block)
  end
end
