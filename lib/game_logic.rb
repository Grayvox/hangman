# frozen_string_literal: true

# Contains the main logic methods for the game
module GameLogic
  def pick_random_word
    File.readlines('./words.text').sample
  end
end
