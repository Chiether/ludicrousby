require 'spec_helper'

shared_examples_for 'check_logic' do |syntax, cond1, cond2, cond3|
  context '#calculation?' do
    subject { syntax.calculate? }
    example { expect(subject).to eq cond1 }
  end
  context '#calculation(:safe)' do
    subject { syntax.calculate(:safe) }
    if cond2.kind_of?(Class) && cond2.ancestors.include?(Exception)
      example { expect{subject}.to raise_exception(cond2) }
    else
      example { expect(subject).to eq cond2 }
    end
  end
  context '#calculation(:danger)' do
    subject { syntax.calculate(:danger) }
    if cond3.kind_of?(Class) && cond3.ancestors.include?(Exception)
      example { expect{subject}.to raise_exception(cond3) }
    else
      example { expect(subject).to eq cond3 }
    end
  end
end

describe String do
  describe 'calculate' do
    describe 'simple syntax' do
      describe 'addition' do
        it_behaves_like 'check_logic', ['8+4', true, 12, 12]
      end
      describe 'subtraction' do
        it_behaves_like 'check_logic', ['8-4', true, 4, 4]
      end
      describe 'multiplication' do
        it_behaves_like 'check_logic', ['8*4', true, 32, 32]
      end
      describe 'division' do
        it_behaves_like 'check_logic', ['8/4', true, 2, 2]
      end
    end

    describe 'div zero' do
      describe 'Integer can not division zero' do
        it_behaves_like 'check_logic', ['1/0', true, ZeroDivisionError, ZeroDivisionError]
      end
      describe 'Float can division zero to Infinity' do
        it_behaves_like 'check_logic', ['1.0/0', true, Float::INFINITY, Float::INFINITY]
      end
    end

    describe 'rank_order' do
      describe 'same(rank1) addition-subtraction' do
        it_behaves_like 'check_logic', ['8+4-2', true, 10, 10]
      end
      describe 'same(rank1) subtraction-addition' do
        it_behaves_like 'check_logic', ['8-4+2', true, 6, 6]
      end
      describe 'same(rank2) multiplication-division' do
        it_behaves_like 'check_logic', ['8*4/2', true, 16, 16]
      end
      describe 'same(rank2) division-multiplication' do
        it_behaves_like 'check_logic', ['8/4*2', true, 4, 4]
      end
      describe 'diff(rank1-rank2) add-mul' do
        it_behaves_like 'check_logic', ['8+4*2', true, 16, 16]
      end
      describe 'diff(rank1-rank2) mul-add' do
        it_behaves_like 'check_logic', ['8*4+2', true, 34, 34]
      end
      describe 'diff(rank1-rank2) add-sub' do
        it_behaves_like 'check_logic', ['8+4/2', true, 10, 10]
      end
      describe 'diff(rank1-rank2) sub-add' do
        it_behaves_like 'check_logic', ['8/4+2', true, 4, 4]
      end
    end

  end
end
