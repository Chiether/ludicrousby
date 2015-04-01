require 'spec_helper'

describe Integer do
  describe '#comma' do
    subject { receiver.comma(*params) }
    describe 'positive' do
      context 'when receiver is 12345000' do
        let(:receiver) { 12_345_000 }
        context 'with comma(3) - ex. global' do
          let(:params) { [3] }
          example { expect(subject).to eq '12,345,000' }
        end
        context 'with comma(4) - ex. Japan' do
          let(:params) { [4] }
          example { expect(subject).to eq '1234,5000' }
        end
        context 'with comma(3,2) - ex. india' do
          let(:params) { [3, 2] }
          example { expect(subject).to eq '1,23,45,000' }
        end
      end
    end
    describe 'zero' do
      context 'when receiver is 0' do
        let(:receiver) { 0 }
        context 'with comma(3) - ex. global' do
          let(:params) { [3] }
          example { expect(subject).to eq '0' }
        end
      end
    end
    describe 'negative' do
      context 'when receiver is -12345000' do
        let(:receiver) { -12_345_000 }
        context 'with comma(3) - ex. global' do
          let(:params) { [3] }
          example { expect(subject).to eq '-12,345,000' }
        end
        context 'with comma(4) - ex. Japan' do
          let(:params) { [4] }
          example { expect(subject).to eq '-1234,5000' }
        end
        context 'with comma(3,2) - ex. india' do
          let(:params) { [3, 2] }
          example { expect(subject).to eq '-1,23,45,000' }
        end
      end
    end
    describe 'its not support to Float' do
      let(:receiver) { 123_456.7890 }
      let(:params) { [3] }
      example { expect(proc { subject }).to raise_exception(NoMethodError) }
    end
  end
end
