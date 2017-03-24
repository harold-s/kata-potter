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
      it { is_expected.to eq 0 }
    end
    context '1 book' do
      let(:books) { [0] }
      it { is_expected.to eq 8 }
    end
    context '2 different books' do
      let(:books) { [0, 1] }
      it { is_expected.to eq 15.2 }
    end
    context '3 books with 2 different books' do
      let(:books) { [0, 1, 1] }
      it { is_expected.to eq 23.2 }
    end
    context '3 different books' do
      let(:books) { [0, 1, 2] }
      it { is_expected.to eq 21.6 }
    end
    context '4 books with 3 different books' do
      let(:books) { [0, 1, 2, 1] }
      it { is_expected.to eq 29.6 }
    end
    context '4 different books' do
      let(:books) { [0, 1, 2, 3] }
      it { is_expected.to eq 25.6 }
    end
    context '5 different books' do
      let(:books) { [0, 1, 2, 3, 4] }
      it { is_expected.to eq 30 }
    end
    context '8 books with 2 sets of discounts' do
      let(:books) { [0, 1, 2, 3, 4, 2, 4, 1] }
      it { is_expected.to eq 51.6 }
    end
    context '9 books with 3 sets of discounts' do
      let(:books) { [0, 1, 2, 3, 4, 2, 4, 1, 1, 2] }
      it { is_expected.to eq 66.8 }
    end
  end
end
