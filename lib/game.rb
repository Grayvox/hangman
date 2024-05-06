# frozen_string_literal: true

# Defines the game itself
class Game
  private

  attr_accessor :player_name, :secret_word, :display_word, :incorrect_guesses, :already_guessed

  public

  def guess_letter(start_text: true)
    puts 'Please input your next guess.' if start_text
    guess = gets.chomp.downcase
    if guess.length != 1
      puts 'Hey! Guesses must be only ONE letter. Please try again.'
      return guess_letter(start_text: false)
    elsif @already_guessed.include?(guess)
      puts 'That letter has already been guessed. Please try again.'
      return guess_letter(start_text: false)
    end
    guess
  end
end
