require 'optparse'
require_relative 'lib/board'
require_relative 'lib/dictionary'
require_relative 'lib/solver'

# Parse the passed options from the command line.
options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: boggle.rb [options]'

  opts.on('-w', '--width VALUE', 'Board width') do |w|
    options[:width] = w.to_i
  end

  opts.on('-h', '--height VALUE', 'Board height') do |h|
    options[:height] = h.to_i
  end
end.parse!

# Create a new game board and dictionary
board = Board.new(options[:width], options[:height])
dictionary = Dictionary.new

# Print out the board to the console before getting started.
board.display

# Run the solution on the created board.
solver = Solver.new(board, dictionary)
words = solver.solve

# Print out the found words to the console.
words.each { |word| puts word }
