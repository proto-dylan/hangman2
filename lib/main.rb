require 'library.txt'

class Game
  def initialize
    choose_word
  end
end

def choose_word
  File.readlines('library.txt').each do |word|
    puts word if word.length.between?(5, 12)
  end
end
game = Game.new
