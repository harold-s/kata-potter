# frozen_string_literal: true
class PriceCalculator
  attr_reader :books
  BOOK_BASE_PRICE = 8
  DISCOUNTS = {
    2 => 5,
    3 => 10,
    4 => 20,
    5 => 25
  }.freeze

  def initialize(books)
    @books = books
  end

  def calculate
    books.count * BOOK_BASE_PRICE * (1 - (discount.to_f / 100))
  end

  private

  def discount
    DISCOUNTS[books.size] || 0
  end
end
