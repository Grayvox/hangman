# frozen_string_literal: true

require 'json'

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
    when 'load', 'l'
      load_game
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

  def new_game
    puts 'Starting new game...'
    puts 'First, enter your name.'
    @player_name = gets.chomp
    puts 'Great! The game can now start.'

    @secret_word = pick_random_word
    @display_word = generate_display(@secret_word)
    @incorrect_guesses = 0
    @already_guessed = []

    game_loop
  end

  def load_game
    puts 'Loading previously saved games...'
    # To be made later
  end

  def save_game(file_name)
    current_game_data = {
      'player_saved': @player_name,
      'already_guessed_saved': @already_guessed,
      'incorrect_guesses_saved': @incorrect_guesses,
      'secret_saved': @secret_word,
      'display_saved': @display_word
    }

    File.write("./saved/#{file_name}.json", JSON.pretty_generate(current_game_data))
  end

  def save_prompts
    puts 'Please enter what you want to name this game (This is case insensitive).'
    file_name = gets.chomp.downcase
    if file_name.empty?
      puts 'Sorry! Your game file has to have at least one character in the name. Try again.'
      return save_prompts
    end
    puts 'Saving game...'
    save_game(file_name)
    puts 'Game successfully saved! Goodbye!'
  end
end
