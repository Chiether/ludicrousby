require 'spec_helper'

describe Object do
  describe '#any_of? (*params)' do
    subject { receiver.any_of? *params }
    context 'when receiver is "sample"' do
      let(:receiver) { 'sample' }
      context 'with (nil, :sample, "polish")' do
        let(:params) { [nil, :sample, 'polish'] }
        example { expect(subject).to be_falsey }
      end
      context 'with (nil, "sample", "polish")' do
        let(:params) { [nil, receiver, 'polish'] }
        example { expect(subject).to be_truthy }
      end
    end
    context 'when receiver is 0.0 -- FloatClass' do
      let(:receiver) { 0.0 }
      context 'with (0, 1, 2)' do
        let(:params) { [0, 1, 2] }
        example { expect(subject).to be_falsey }
      end
      context 'with (0, 1, 2)' do
        let(:params) { [0.0, 1, 2] }
        example { expect(subject).to be_truthy }
      end
    end
  end
end
