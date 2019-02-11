##
# Represents a dictionary of valid English words.
class Dictionary
  WORDS_FILE_PATH = File.join(File.dirname(__FILE__), '../words')

  def initialize
    @words = read_from_file(WORDS_FILE_PATH)
  end

  ##
  # Returns true if `word` is a valid English word,
  # and false if not.

  def word?(word)
    @words.include?(word)
  end

  private

  def read_from_file(path)
    File.readlines(path).map(&:chomp)
  end
end
