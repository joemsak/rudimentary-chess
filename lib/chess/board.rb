require 'chess/board/board_space'

module Chess
  class Board
    attr_reader :spaces

    def initialize
      @spaces = initialize_spaces
    end

    def space(file_rank)
      spaces.select { |s| s.file_rank == file_rank }.first
    end

    private
    def initialize_spaces
      ranks.flat_map do |rank|
        files.map do |file|
          BoardSpace.new(rank, file)
        end
      end
    end

    def ranks
      (1..8).to_a
    end

    def files
      ('a'..'h').to_a
    end
  end
end
