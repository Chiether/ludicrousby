require 'spec_helper'

describe Array do

  let(:instance){
    Array::Table.new([
      [1,2,3,nil],
      [1,2,3,4,5,nil],
      [1,2,3,4,nil],
      [nil]
    ])
  }

  describe :max do

  end
  describe :min do

  end
  describe :avg do

  end

  describe '#lpad!' do
    before{ instance.lpad! }
    subject{ instance }
    example{ expect(subject).to eq([
                                       [nil,nil,1,2,3,nil],
                                       [1,2,3,4,5,nil],
                                       [nil,1,2,3,4,nil],
                                       [nil,nil,nil,nil,nil,nil]
                                   ])}

  end

  describe '#rpad!' do
    before{ instance.rpad! }
    subject{ instance }
    example{ expect(subject).to eq([
                                       [1,2,3,nil,nil,nil],
                                       [1,2,3,4,5,nil],
                                       [1,2,3,4,nil,nil],
                                       [nil,nil,nil,nil,nil,nil]
                                   ])}

  end

end
