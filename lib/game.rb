# frozen_string_literal: true

# Defines the game itself
class Game
  attr_reader :incorrect_guesses, :already_guessed, :secret_word, :display_word

  private

  attr_writer :incorrect_guesses, :already_guessed, :secret_word, :display_word
end
