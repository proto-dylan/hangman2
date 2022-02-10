class Game
  attr_accessor :word  
  def initialize
    @word = choose_word
  end
  

end

def choose_word
  library = []
  File.readlines('./lib/library.txt').each { |word| library.push(word.chomp) if word.chomp.length.between?(5, 12) }
  library.sample
end
game = Game.new
p game.word
