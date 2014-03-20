require './ruby/array/cumulative'
describe Array do
  subject{ receiver }
  context 'when receiver is [1, 2, 3, 4, 5]' do
    let(:receiver){ [1, 2, 3, 4, 5] }
    let(:cumulative){ [1, 3, 6, 10, 15] }
    describe '#cumulative' do
      example{ expect(subject.cumulative).to eq cumulative }
    end
    describe '#cumulative!' do
      context 'with receive(:cumulative){ [1,2,3] } - called not bang_method' do
        example{
          subject.cumulative!
          expect(subject).to eq cumulative
        }
        example('receive(:cumulative).once -- called non bang_method'){
          expect(subject).to receive(:cumulative).once{[1,2,3]}
          subject.cumulative!
          expect(subject).to eq receiver
        }
        example('receive(:replace).once -- I am bang_method'){
          expect(subject).to receive(:replace).once
          subject.cumulative!
          expect(subject).to eq receiver
        }
      end
    end
  end
end
