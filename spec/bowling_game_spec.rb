require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../bowling_game.rb'

describe BowlingGame do
  let(:game) {BowlingGame.new}
  
  describe '.initialize' do
    it 'sets @rolls to an empty array' do
      game = BowlingGame.new

      expect(game.rolls).to eq([])
    end
  end
  describe '#score' do
    context 'when only gutter balls are thrown' do
      it 'scores thae game as 0' do
        20.times {game.roll(0)}

        expect(game.score).to eq(0)
      end
    end

    context ' when one pin is kocked down each roll' do
      it 'scores the game as 20 ' do
        20.times {game.roll(1)}

        expect(game.score).to eq(20)
      end
    end
  end
end