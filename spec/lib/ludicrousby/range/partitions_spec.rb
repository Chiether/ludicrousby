require 'spec_helper'

describe Range do
  describe '#partition' do
    subject{ receiver.partitions(*params) }
    describe 'desired' do
      context 'when receiver is (2..11)' do
        let(:receiver){ (2..11) }
        context 'with 4 splits and nil(->0) points' do
          let(:params){ [4, 0] }
          it{ should eq [2..4, 5..6, 7..9, 10..11] }
        end
        context 'with 10 splits and 0 points' do
          let(:params){ [10] }
          example{ expect(subject).to eq [2..2, 3..3, 4..4, 5..5, 6..6, 7..7, 8..8, 9..9, 10..10, 11..11] }
        end
        context 'with 10 splits and 1 points' do
          let!(:params){ [10,1] }
          example{ expect(subject).to eq [2.0..2.8, 2.9..3.7, 3.8..4.6, 4.7..5.5, 5.6..6.4, 6.5..7.4, 7.5..8.3, 8.4..9.2, 9.3..10.1, 10.2..11.0]}
        end
        context 'with 10 splits and "1A"(->to_i) points' do
          let!(:params){ [10,'1A'] }
          example{ expect(subject).to eq [2.0..2.8, 2.9..3.7, 3.8..4.6, 4.7..5.5, 5.6..6.4, 6.5..7.4, 7.5..8.3, 8.4..9.2, 9.3..10.1, 10.2..11.0]}
        end
      end
    end
  describe 'undesired'
    context 'when receiver is (0.2..0.7)' do
      let(:receiver){ (0.2..0.7) }
      context 'with 3 split and 0 POINT - COULD NOT EXPRESSIVE IT' do
        let(:params){ [3,0] }
        example{ expect(subject).to eq [0..0, 1..0] }
      end
    end
    context 'when receiver is (10..2) - NOT SUPPORT REVERSED BY RANGE-CLASS' do
      let(:receiver){ (11..2) }
      context 'with 3 splits and 0 points' do
        let(:params){ [3,0] }
        example{ expect(subject).to eq [] }
      end
    end
  end
end
