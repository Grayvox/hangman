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
        |     / \

    Incorrect Guesses: 6/6
    )
  end
end
