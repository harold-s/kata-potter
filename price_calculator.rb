# frozen_string_literal: true
class PriceCalculator
  attr_reader :books
  BOOK_BASE_PRICE = 8

  def initialize(books)
    @books = books
  end

  def calculate
    books.count * BOOK_BASE_PRICE
  end
end
