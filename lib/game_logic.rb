# frozen_string_literal: true

# Contains the main logic methods for the game
module GameLogic
  def pick_random_word
    words = File.readlines('./words.txt').shuffle
    words.each do |line|
      return line if line.length < 12 && line.length > 5
    end
  end

  def generate_display(secret)
    display = []
    secret.split('').each { |_| display << '_' }
    display.join(' ')
  end

  def check_guess(secret, guess)
    return false unless secret.include?(guess)

    puts 'Correct! You guessed successfully.'
    true
  end

  def fill_display_gaps(display, secret, guess)
    display_arr = display.split(' ')
    secret_arr = secret.split('')

    secret_arr.each_with_index do |letter, index|
      display_arr[index] = letter if secret_arr[index] == guess
    end
    puts 'Correct! You guessed successfully.'
    display_arr.join(' ')
  end

  def win_check(display, secret)
    display.gsub(/\s+/, '') == secret
  end
end
