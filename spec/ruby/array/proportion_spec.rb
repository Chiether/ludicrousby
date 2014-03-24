require './ruby/array/proportion'
describe Array do
  describe '#proportion' do
    subject{ receiver.proportion(param) }
    context 'when receiver is [0.5, 2, -3, 4.0, 5](Array)' do
      let(:receiver){ [0.5, 2, -3, 4.0, 5] }
      context 'with .proportion(:max)' do
        let(:param){ :max }
        example{ expect(subject).to eq [0.1, 0.4, -0.6, 0.8, 1.0] }
      end
      context 'with .proportion(:min)' do
        let(:param){ :min }
        example{ expect(subject).to eq [-0.16666666666666666, -0.6666666666666666, 1.0, -1.3333333333333333, -1.6666666666666667] }
      end
      context 'with .proportion(2.5)' do
        let(:param){ 2.5 }
        example{ expect(subject).to eq [0.2, 0.8, -1.2, 1.6, 2.0] }
      end
    end
    context 'when receiver is {:a=>0.5, :b=>2, :c=>-3, :d=>4.0, :e=>5}(Hash)' do
      let(:receiver){ {:a=>0.5, :b=>2, :c=>-3, :d=>4.0, :e=>5} }
      context 'with .proportion(:max)' do
        let(:param){ :max }
        example{ expect(subject).to eq ({:a=>0.1, :b=>0.4, :c=>-0.6, :d=>0.8, :e=>1.0}) }
      end
      context 'with .proportion(:min)' do
        let(:param){ :min }
        example{ expect(subject).to eq ({:a=>-0.16666666666666666, :b=>-0.6666666666666666, :c=>1.0, :d=>-1.3333333333333333, :e=>-1.6666666666666667}) }
      end
      context 'with .proportion(2.5)' do
        let(:param){ 2.5 }
        example{ expect(subject).to eq ({:a=>0.2, :b=>0.8, :c=>-1.2, :d=>1.6, :e=>2.0}) }
      end
    end
    context 'when receiver is 1..10(Range)' do
      let(:receiver){ (1..10) }
      context 'with .proportion(:max)' do
        let(:param){ :max }
        example{ expect(subject).to eq ([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]) }
      end
      context 'with .proportion(:min)' do
        let(:param){ :min }
        example{ expect(subject).to eq ([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]) }
      end
      context 'with .proportion(2.5)' do
        let(:param){ 2.5 }
        example{ expect(subject).to eq ([0.4, 0.8, 1.2, 1.6, 2.0, 2.4, 2.8, 3.2, 3.6, 4.0]) }
      end
    end
  end
end
