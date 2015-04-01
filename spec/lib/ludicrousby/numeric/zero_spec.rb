require 'spec_helper'

describe Numeric do
  describe '#zero?' do
    subject { receiver.zero? }
    context 'when receiver is 0' do
      let(:receiver) { 0 }
      example { expect(subject).to be_truthy }
    end
    context 'when receiver is 0.0' do
      let(:receiver) { 0.0 }
      example { expect(subject).to be_truthy }
    end
    context 'when receiver is 0.001' do
      let(:receiver) { 0.1 }
      example { expect(subject).to be_falsey }
    end
  end
end
