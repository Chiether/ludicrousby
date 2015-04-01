require 'spec_helper'
require 'date'

describe Date do
  describe '#days_in_month' do
    subject { current.days_in_month }
    context 'current_date is 2000-02-03' do
      let(:current) { Date.new(2000, 2, 3) }
      example { expect(subject).to eq 29 }
    end
    context 'current_date is 2004-02-03' do
      let(:current) { Date.new(2000, 2, 3) }
      example { expect(subject).to eq 29 }
    end
    context 'current_date is 2100-02-03' do
      let(:current) { Date.new(2100, 2, 3) }
      example { expect(subject).to eq 28 }
    end
  end
end
