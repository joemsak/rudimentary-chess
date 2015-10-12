require 'spec_helper'
require './lib/chess/board'

RSpec.describe Chess::Board do
  context 'initialize' do
    let(:board) { described_class.new }

    it 'has an 8x8 grid' do
      expect(board.spaces.size).to eq(64)
      expect(board.space('d5')).to be_empty

      expect(board.space('d9')).to be_nil
      expect(board.space('i8')).to be_nil
    end

    it "places pawns in each player's second rank" do
      ('a'..'h').each do |file|
        space = board.space("#{file}2")

        expect(space).not_to be_empty
        expect(space.piece).to eq('pawn')

        space = board.space("#{file}7")

        expect(space).not_to be_empty
        expect(space.piece).to eq('pawn')
      end
    end

    it 'places rooks in the corners' do
      %w(a1 h1 a8 h8).each do |file_rank|
        space = board.space(file_rank)

        expect(space).not_to be_empty
        expect(space.piece).to eq('rook')
      end
    end

    it 'places knights next to rooks' do
      %w(b1 g1 b8 g8).each do |file_rank|
        space = board.space(file_rank)

        expect(space).not_to be_empty
        expect(space.piece).to eq('knight')
      end
    end

    it 'places bishops next to knights' do
      %w(c1 f1 c8 f8).each do |file_rank|
        space = board.space(file_rank)

        expect(space).not_to be_empty
        expect(space.piece).to eq('bishop')
      end
    end

    it 'places queens at file d' do
      %w(d1 d8).each do |file_rank|
        space = board.space(file_rank)

        expect(space).not_to be_empty
        expect(space.piece).to eq('queen')
      end
    end

    it 'places kings at file e' do
      %w(e1 e8).each do |file_rank|
        space = board.space(file_rank)

        expect(space).not_to be_empty
        expect(space.piece).to eq('king')
      end
    end
  end
end
