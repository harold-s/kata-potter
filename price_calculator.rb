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
    books.count * BOOK_BASE_PRICE - discount
  end

  private

  def discount
    discount_pc = DISCOUNTS[books.size] || 0
    BOOK_BASE_PRICE * books.size * (discount_pc.to_f / 100)
  end
end
