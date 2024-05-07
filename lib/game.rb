# frozen_string_literal: true

require_relative 'game_logic'
require_relative 'text'
require_relative 'character'

# Defines the game itself
class Game
  include GameLogic
  include Text
  include Character

  private

  attr_accessor :player_name, :secret_word, :display_word, :incorrect_guesses, :already_guessed

  public

  def play
    puts 'First, enter your name.'
    @player_name = gets.chomp
    puts 'Great! The game can now start.'

    @secret_word = pick_random_word
    @display_word = generate_display(@secret_word)
    @incorrect_guesses = 0
    @already_guessed = []

    game_loop
  end

  private

  def game_loop
    until @incorrect_guesses == 6
      puts draw_character(@incorrect_guesses, @display_word)
      return puts win_text(@player_name) if win_check(@display_word, @secret_word)

      guess = guess_letter
      if check_guess(@secret_word, guess) == false
        not_correct_result(guess)
        next
      end
      already_guessed << guess
      @display_word = fill_display_gaps(@display_word, @secret_word, guess)
    end
  end

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

  def not_correct_result(guess)
    puts 'Argh! That letter is not present in the word. That poor hanging man...'
    already_guessed << guess
    @incorrect_guesses += 1
  end
end

Game.new.play
