require 'spec_helper'

describe Float do
  subject{ receiver.digit_numbers }
  context 'when receiver is 123.456780' do
    let(:receiver){ 123.456780 }
    describe '#digit_numbers' do
      example{ expect(subject).to eq [3,5] }
    end
  end
end
