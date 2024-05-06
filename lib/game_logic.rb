# frozen_string_literal: true

# Contains the main logic methods for the game
module GameLogic
  def pick_random_word
    words = File.readlines('./words.txt').shuffle
    words.each do |line|
      return line if line.length < 12 && line.length > 5
    end
  end

  def compare_guess(display, secret, guess)
    display_arr = display.split(' ')
    secret_arr = secret.split('')

    secret_arr.each_with_index do |letter, index|
      display_arr[index] = letter if secret_arr[index] == guess
    end
    puts 'Correct! You guessed successfully.'
    display_arr.join(' ')
  end
end
