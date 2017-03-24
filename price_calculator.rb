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
    books.count * BOOK_BASE_PRICE - total_discount
  end

  private

  def books_counts_by_nb
    @books_counts_by_nb ||= {}.tap do |books_counts_by_nb|
      books.each do |book_id|
        books_counts_by_nb[book_id] ||= 0
        books_counts_by_nb[book_id] += 1
      end
    end
  end

  def total_discount
    set_nb_max = books_counts_by_nb.values.max || 0
    (1..set_nb_max).map { |set_nb| discount_for_set_nb(set_nb) }.sum
  end

  def discount_for_set_nb(set_nb)
    discount_book_nb(books_counts_by_nb.values.select { |v| v >= set_nb }.count)
  end

  def discount_book_nb(book_nb)
    discount_pc = DISCOUNTS[book_nb] || 0
    BOOK_BASE_PRICE * book_nb * (discount_pc.to_f / 100)
  end
end
