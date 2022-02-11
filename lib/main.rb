class Game
  attr_accessor :word, :guesses

  def initialize
    @word = choose_word.chars
    @attempts = @word.length
    @guesses = Array.new(@attempts, '_')
    @guessed_before = []
    word_check
    play
  end
end

def choose_word
  library = []
  File.readlines('./lib/library.txt').each { |word| library.push(word.chomp) if word.chomp.length.between?(5, 12) }

  library.sample
end

def play
  puts "Welcome to the dictionary-dungeon gallows\n\n"
  win = false
  while @attempts > 0 && win == false
    display
    check_guess(get_guess)
    unless @guesses.include?('_')
      win = true
      break
    end
  end
  display
  new_game?
end

def word_check
  puts '======================='
  puts "Word: #{@word}"
  puts "Guesses array: #{@guesses}"
  puts '======================='
end

def display
  puts "Attempts left: #{@attempts}"
  puts "Guessed letters: #{@guessed_before.join(" ")}\n\n"
  puts "#{@guesses.join(' ')}\n\n"
end

def get_guess
  guess = nil
  while guess.nil?
    puts 'Enter guess'
    input = gets.chomp
    if input[/[a-zA-Z]+/] == input && 
      unless @guessed_before.include?(input) 
        guess = input.downcase
        @guessed_before << guess
      end
    else
      puts " \n    enter a valid guess   \n"
    end
  end
  guess
end

def check_guess(guess)
  bad_guess = true
  @word.each_with_index do |char, i|
    next unless char == guess 
    @guesses[i] = char
    puts 'noice'
    bad_guess = false
  end
  if bad_guess == true then @attempts -= 1 end
  
end

def new_game?
  while true
    puts "Play again? [y/n]: "
    case gets.strip.downcase
    when 'y'
      self.initialize
    when 'n'
      puts "later taters"
      break
    end
  end
end

game = Game.new
