# frozen_string_literal: true

require 'json'

require_relative 'game_logic'
require_relative 'game_data'
require_relative 'text'
require_relative 'character'

# Defines the game itself
class Game
  include GameLogic
  include GameData
  include Text
  include Character

  private

  attr_accessor :player_name, :secret_word, :display_word, :incorrect_guesses, :already_guessed

  public

  def play(intro: true)
    puts intro_text if intro
    puts 'Welcome to Hangman!'
    starting_prompt
  end

  private

  # rubocop:disable Metrics/MethodLength
  def starting_prompt
    puts "Do you wish to start a new game or load an old game? Respond with either 'new' or 'load'."
    answer = gets.chomp.downcase
    case answer
    when 'new', 'n'
      new_game
      game_loop
    when 'load', 'l'
      load_prompts
      game_loop
    else
      puts "Please answer with either 'new' or 'load'. Or, if you like, shorten one of those to the first letter."
      starting_prompt
    end
  end
  # rubocop:enable Metrics/MethodLength

  def replay
    puts 'Would you like to play again? Respond with either Y or N.'
    answer = gets.chomp.downcase
    if answer == 'y'
      puts 'Restarting game...'
      play
    else
      puts 'Thanks for playing! Goodbye!'
    end
  end

  # rubocop:disable Metrics/MethodLength
  def game_loop
    until @incorrect_guesses == 6
      puts draw_character(@incorrect_guesses, @display_word)
      return player_wins if win_check(@display_word, @secret_word)

      guess = guess_letter
      return save_prompts if guess == 'save'

      if check_guess(@secret_word, guess) == false
        not_correct_result(guess)
        next
      end
      already_guessed << guess
      @display_word = fill_display_gaps(@display_word, @secret_word, guess)
    end
    player_loses
  end
  # rubocop:enable Metrics/MethodLength
end
