# frozen_string_literal: true

# For creating, saving and loading game data
module GameData
  def new_game
    puts 'Starting new game...'
    puts 'First, enter your name.'
    @player_name = gets.chomp
    puts 'Great! The game can now start.'

    @secret_word = pick_random_word
    @display_word = generate_display(@secret_word)
    @incorrect_guesses = 0
    @already_guessed = []
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
    puts 'Please enter what you want to name this game (This is case sensitive).'
    file_name = gets.chomp
    if file_name.empty?
      puts 'Sorry! Your game file has to have at least one character in the name. Try again.'
      return save_prompts
    end
    puts 'Saving game...'
    save_game(file_name)
    puts 'Game successfully saved! Goodbye!'
  end

  def load_game(file)
    data = JSON.load_file("./saved/#{file}.json")

    @player_name = data['player_saved']
    @secret_word = data['secret_saved']
    @display_word = data['display_saved']
    @incorrect_guesses = data['incorrect_guesses_saved']
    @already_guessed = data['already_guessed_saved']
  end

  # rubocop:disable Metrics/MethodLength
  def load_prompts
    @seperation_lines = "\u001b[37;1;1m--------------------------\u001b[0m"

    puts 'Loading previously saved games...'
    puts @seperation_lines
    list = Dir.children('./saved').map! { |name| name.gsub('.json', '') }
    puts list
    puts @seperation_lines
    puts 'Which game do you wish to continue playing? (This is case sensitive)'
    answer = gets.chomp
    unless list.include?(answer)
      puts 'There is no file with that name. Please try again.'
      return load_prompts
    end
    load_game(answer)
  end
  # rubocop:enable Metrics/MethodLength
end
