# frozen_string_literal: true

# Text to be used when a game is happening
module Text
  # rubocop:disable Metrics/MethodLength
  def intro_text
    %(

    \u001b[37;43m\n
    ===================
    \s\s\s\s\sHANGMAN\s\s\s\s
    \s\s\s\sBY\sGRAYVOX\s\s\s
    ===================\n\u001b[0m

    The goal of Hangman is simple - try to guess a word, one letter at a time on each turn, without making
    6 wrong guesses.

    When running the program, the player can choose to either start a new game or load a previously saved
    game.

    At the start of a new game, a random word - between 5 and 12 characters long - will be generated. The game
    will then showcase a bunch of underscores where the letters need to be filled in. It will also generate
    a gallow on the command line for later.

    Each turn, the player will have to input a letter they have yet to guess and see if it is somewhere in
    the "secret word". If they guessed correctly, the letter will be filled in wherever it is present in the
    word. If they guessed incorrectly, a new part of the hanging man will be drawn on the gallow. If the
    player manages to guess incorrectly 6 times, the man will be fully drawn and dead, thereby ending the
    game in a loss.

    At any time during the game, the player has the option to save and quit the game that is currently in
    progress for them to play later. Saving the game will generate a JSON file, containing the player name,
    the letters already guessed, the amount of incorrect guesses made, the secret word, and the "display
    version" of the secret word (containing all the correct letters made and underscores in place of the
    letters not yet guessed).

    Have fun!
    -Grayvox
    \u001b[37;43m
    \u001b[0m
    )
  end
  # rubocop:enable Metrics/MethodLength

  def win_text(player)
    %(

    \s\s\s\s\s\s\s\s\sYOU WON
    \u001b[37;1;1m--------------------------\u001b[0m\n
    #{player} has won the game! Congratulations!

    )
  end
end
