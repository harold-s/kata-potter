# frozen_string_literal: true
require_relative '../price_calculator'

RSpec.describe PriceCalculator do
  subject(:instance) { described_class.new(books) }
  describe '#new' do
    let(:books) { [0, 2] }
    it 'sets the book array' do
      expect(instance.books).to eq(books)
    end
  end

  describe '#calculate' do
    subject { instance.calculate }
    context '1 book' do
      let(:books) { [0] }
      it 'returns 8' do
        is_expected.to eq 8
      end
    end
  end
end