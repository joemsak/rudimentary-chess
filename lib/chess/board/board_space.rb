module Chess
  class BoardSpace
    attr_reader :rank, :file, :piece

    def initialize(rank, file)
      @rank = rank
      @file = file
      @piece = place_piece
    end

    def file_rank
      "#{file}#{rank}"
    end

    def empty?
      piece.nil?
    end

    private
    def place_piece
      case rank
      when 2, 7
        'pawn'
      when 1, 8
        place_first_row_piece
      end
    end

    def place_first_row_piece
      case file
      when 'a', 'h'
        'rook'
      when 'b', 'g'
        'knight'
      when 'c', 'f'
        'bishop'
      when 'd'
        'queen'
      when 'e'
        'king'
      end
    end
  end
end
