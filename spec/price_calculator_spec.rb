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
    context '0 book' do
      let(:books) { [] }
      it 'returns 0' do
        is_expected.to eq 0
      end
    end
    context '1 book' do
      let(:books) { [0] }
      it 'returns 8' do
        is_expected.to eq 8
      end
    end
    context '2 different books (with discount)' do
      let(:books) { [0, 1] }
      it 'returns 15.2' do
        is_expected.to eq 15.2
      end
    end
    context '3 different books (with discount)' do
      let(:books) { [0, 1, 2] }
      it 'returns 21.6' do
        is_expected.to eq 21.6
      end
    end
    context '4 different books (with discount)' do
      let(:books) { [0, 1, 2, 3] }
      it 'returns 25.6' do
        is_expected.to eq 25.6
      end
    end
    context '5 different books (with discount)' do
      let(:books) { [0, 1, 2, 3, 4] }
      it 'returns 30' do
        is_expected.to eq 30
      end
    end
  end
end
