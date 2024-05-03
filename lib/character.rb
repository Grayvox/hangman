# frozen_string_literal: true

# Contains all the possible drawings of the hanging man
module Character
  def no_wrong_guesses
    %(
        ________
        |      |
        |
        |
        |

    Incorrect Guesses: 0/6
    )
  end

  def one_wrong_guess
    %(
        ________
        |      |
        |    (ಠ_ಠ)
        |
        |

    Incorrect Guesses: 1/6
    )
  end

  def two_wrong_guesses
    %(
        ________
        |      |
        |    (ಠ_ಠ)┘
        |
        |

    Incorrect Guesses: 2/6
    )
  end

  def three_wrong_guesses
    %(
        ________
        |      |
        |   ┌(ಠ_ಠ)┘
        |
        |

    Incorrect Guesses: 3/6
    )
  end

  def four_wrong_guesses
    %(
        ________
        |      |
        |   ┌(ಠ_ಠ)┘
        |      |
        |

    Incorrect Guesses: 4/6
    )
  end

  def five_wrong_guesses
    %(
        ________
        |      |
        |   ┌(ಠ_ಠ)┘
        |      |
        |     /

    Incorrect Guesses: 5/6
    )
  end

  def dead_character
    %(
        ________
        |      |
        |   ┌(x_x)┘
        |      |
        |     / \\

    Incorrect Guesses: 6/6
    )
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def draw_character(wrong_guesses)
    case wrong_guesses
    when 0
      no_wrong_guesses
    when 1
      one_wrong_guess
    when 2
      two_wrong_guesses
    when 3
      three_wrong_guesses
    when 4
      four_wrong_guesses
    when 5
      five_wrong_guesses
    when 6
      dead_character
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity
end
