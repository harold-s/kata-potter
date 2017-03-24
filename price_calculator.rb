# frozen_string_literal: true
class PriceCalculator
  attr_reader :books

  def initialize(books)
    @books = books
  end
end
