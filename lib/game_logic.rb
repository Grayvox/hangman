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

  def guess_letter(start_text: true)
    puts 'Please input your next guess.' if start_text
    guess = gets.chomp.downcase
    if guess == 'save'
      return guess
    elsif guess.length != 1
      puts 'Hey! Guesses must be only ONE letter. Please try again.'
      return guess_letter(start_text: false)
    elsif @already_guessed.include?(guess)
      puts 'That letter has already been guessed. Please try again.'
      return guess_letter(start_text: false)
    end
    guess
  end

  def check_guess(secret, guess)
    false unless secret.include?(guess)
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

  def not_correct_result(guess)
    puts 'Argh! That letter is not present in the word. That poor hanging man...'
    already_guessed << guess
    @incorrect_guesses += 1
  end

  def player_wins
    puts win_text(@player_name)
    replay
  end

  def player_loses
    puts draw_character(@incorrect_guesses, @secret_word)
    puts lose_text(@player_name)
    replay
  end

  def win_check(display, secret)
    display.gsub(/\s+/, '') == secret
  end
end
