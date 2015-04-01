require 'spec_helper'

describe Array do
  describe '#cumulative' do
    subject { receiver }
    context 'when receiver is [1, 2, 3, 4, 5]' do
      let(:receiver) { [1, 2, 3, 4, 5] }
      let(:cumulative) { [1, 3, 6, 10, 15] }
      example { expect(subject.cumulative).to eq cumulative }
    end
  end
  describe '#cumulative!' do
    subject { receiver }
    context 'when receiver is [1, 2, 3, 4, 5]' do
      let(:receiver) { [1, 2, 3, 4, 5] }
      let(:cumulative) { [1, 3, 6, 10, 15] }
      context 'with receive(:cumulative){ [1,2,3] } - called not bang_method' do
        example do
          subject.cumulative!
          expect(subject).to eq cumulative
        end
        example('receive(:cumulative).once -- called non bang_method')do
          expect(subject).to receive(:cumulative).once { [1, 2, 3] }
          subject.cumulative!
          expect(subject).to eq receiver
        end
        example('receive(:replace).once -- I am bang_method')do
          expect(subject).to receive(:replace).once
          subject.cumulative!
          expect(subject).to eq receiver
        end
      end
    end
  end
end
