# frozen_string_literal: true

# Contains all the possible drawings of the hanging man
module Character
  def no_wrong_guesses(display)
    %(
        ________
        |      |
        |
        |
        |

    Incorrect Guesses: 0/6

      #{display}
    )
  end

  def one_wrong_guess(display)
    %(
        ________
        |      |
        |    (ಠ_ಠ)
        |
        |

    Incorrect Guesses: 1/6

      #{display}
    )
  end

  def two_wrong_guesses(display)
    %(
        ________
        |      |
        |    (ಠ_ಠ)┘
        |
        |

    Incorrect Guesses: 2/6

      #{display}
    )
  end

  def three_wrong_guesses(display)
    %(
        ________
        |      |
        |   ┌(ಠ_ಠ)┘
        |
        |

    Incorrect Guesses: 3/6

      #{display}
    )
  end

  def four_wrong_guesses(display)
    %(
        ________
        |      |
        |   ┌(ಠ_ಠ)┘
        |      |
        |

    Incorrect Guesses: 4/6

      #{display}
    )
  end

  def five_wrong_guesses(display)
    %(
        ________
        |      |
        |   ┌(ಠ_ಠ)┘
        |      |
        |     /

    Incorrect Guesses: 5/6

      #{display}
    )
  end

  def dead_character(display)
    %(
        ________
        |      |
        |   ┌(x_x)┘
        |      |
        |     / \\

    Incorrect Guesses: 6/6

      #{display}
    )
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def draw_character(wrong_guesses, display)
    case wrong_guesses
    when 0
      no_wrong_guesses(display)
    when 1
      one_wrong_guess(display)
    when 2
      two_wrong_guesses(display)
    when 3
      three_wrong_guesses(display)
    when 4
      four_wrong_guesses(display)
    when 5
      five_wrong_guesses(display)
    when 6
      dead_character(display)
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity
end
