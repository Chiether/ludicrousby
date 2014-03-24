require './ruby/numeric/positive'
describe Numeric do
  describe '#positive?' do
    subject{ receiver.positive? }
    context 'when receiver is -0.1' do
      let(:receiver){ -0.1 }
      example{ expect(subject).to be_falsey }
    end
    context 'when receiver is 0' do
      let(:receiver){ 0 }
      example{ expect(subject).to be_falsey }
    end
    context 'when receiver is +0.1' do
      let(:receiver){ +0.1 }
      example{ expect(subject).to be_truthy }
    end
  end
end
