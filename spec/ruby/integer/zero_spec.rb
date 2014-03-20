require './ruby/integer/zero'
describe Integer do
  subject{ receiver.zero? }
  context 'when receiver is 0' do
    let(:receiver){ 0 }
    describe '#zero?' do
      example{ expect(subject).to be_truthy }
    end
  end
  context 'when receiver is 0.0' do
    let(:receiver){ 0.0 }
    describe '#zero?' do
      example{ expect(subject).to be_truthy }
    end
  end
  context 'when receiver is 0.001' do
    let(:receiver){ 0.1 }
    describe '#zero?' do
      example{ expect(subject).to be_falsey }
    end
  end
end
