##
# This class represents a boggle game board.
# The board is of variable width and height, and each
# cell contains a single letter from A to Z.
class Board
  DEFAULT_WIDTH = 5
  DEFAULT_HEIGHT = 5
  LETTERS = ('A'..'Z').to_a

  ##
  # Creates a new board of size `width` and `height`.

  def initialize(width, height)
    @width = width || DEFAULT_WIDTH
    @height = height || DEFAULT_HEIGHT

    fill_board
  end

  ##
  # Prints an on-screen representation of the game board to stdout.

  def display
    @board.each_with_index do |letter, i|
      puts if (i % @width).zero?
      print letter
    end

    puts
  end

  ##
  # Retrieves the letter value at the location M x N.

  def value(m_value, n_value)
    @board[to_index(m_value, n_value)]
  end

  private

  def to_index(m_value, n_value)
    m_value * @width + n_value
  end

  def fill_board
    @board = Array.new(@width * @height) { random_letter }
  end

  def random_letter
    LETTERS.sample
  end
end
