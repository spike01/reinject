require 'infect'

describe Array do
  
  let(:array) { (1..10).to_a } 
  let(:string_array) { %w(The quick brown fox jumps over the lazy dog) }

  context 'it behaves like #inject' do
 
    it 'sums a series of numbers' do
      expect(array.infect { |x, y| x + y }).to eq(array.inject {|x, y| x + y })
    end

    it 'cumulatively multiplies a series of numbers' do
      expect(array.infect { |x, y| x * y }).to eq(array.inject {|x, y| x * y })
    end

    it 'subtracts an array of numbers' do
      expect(array.infect { |x, y| x - y }).to eq(array.inject {|x, y| x - y } )
    end 

    it 'can be called with an argument' do
      expect(array.infect(10) { |x, y| x + y }).to eq(array.inject(10) {|x, y| x + y } )
    end

    it 'can take a symbol block as an argument' do
      expect(array.infect(&:+)).to eq(array.inject(&:+))
    end

    it 'can concatenate an array of words' do
      expect(string_array.infect(&:+)).to eq(string_array.inject(&:+))
    end

    it 'can take a symbol as an argument' do
      expect(array.infect(:+)).to eq(array.inject(:+))
    end
  end

 context 'it behaves like #inject, but using recursion' do

   it 'doesn\'t mess with the starting array when passed an argument' do
      array.reinject(10) {|x, y| x + y }
      expect(array).to eq((1..10).to_a)
    end

    it 'sums a series of numbers' do
      expect(array.reinject { |x, y| x + y }).to eq(array.inject {|x, y| x + y })
    end

    it 'cumulatively multiplies a series of numbers' do
      expect(array.reinject { |x, y| x * y }).to eq(array.inject {|x, y| x * y })
    end

    it 'subtracts an array of numbers' do
      expect(array.reinject { |x, y| x - y }).to eq(array.inject {|x, y| x - y } )
    end 

    #it 'can be called with an argument' do
      #expect(array.reinject(20) { |x, y| x + y }).to eq(array.inject(20) {|x, y| x + y } )
    #end

    it 'can be called with an argument' do
      expect(array.reinject(20) { |x, y| x + y }).to eq(75)
    end

    it 'can take a symbol block as an argument' do
      expect(array.reinject(&:+)).to eq(array.inject(&:+))
    end

    it 'can concatenate an array of words' do
      expect(string_array.reinject(&:+)).to eq(string_array.inject(&:+))
    end
  end
end

  
