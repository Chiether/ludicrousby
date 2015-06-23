require 'spec_helper'

describe Hash do
  subject { receiver.deletes([:a, :c]) }
  context 'when receiver is 123.456780' do
    let!(:receiver) { { a: 1, b: 2, c: 'I am c' } }
    describe '#deletes' do
      example do
        expect(subject).to eq([1, 'I am c'])
        expect(receiver).to eq(b: 2)
      end
    end
  end
end
