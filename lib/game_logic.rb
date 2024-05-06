# frozen_string_literal: true

# Contains the main logic methods for the game
module GameLogic
  def pick_random_word
    words = File.readlines('./words.txt').shuffle
    words.each do |line|
      return line if line.length < 12 && line.length > 5
    end
  end
end
