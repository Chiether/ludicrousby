require 'spec_helper'

describe Numeric do
  describe '#negative?' do
    subject { receiver.negative? }
    context 'when receiver is -0.1' do
      let(:receiver) { -0.1 }
      example { expect(subject).to be_truthy }
    end
    context 'when receiver is 0' do
      let(:receiver) { 0 }
      example { expect(subject).to be_falsey }
    end
    context 'when receiver is +0.1' do
      let(:receiver) { +0.1 }
      example { expect(subject).to be_falsey }
    end
  end
end
