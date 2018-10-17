require_relative './bowling_game.rb'

RSpec.describe(BowlingGame) do

    # Testing helper for rolling pins 'n' number of times.
    def roll_many(args={})
        turns = args[:turns]
        
        for i in 1..turns do
            args[:game].roll(args[:pins])
        end
    end

    context "When testing BlowingGame glass" do
        it "should initialize a new object", positive: true do
            game = BowlingGame.new
            expect(game).to_not be(nil)
        end
    end

    context "When testing BowlingGame class with a gutter game" do
        
        before(:each) do
            @game = BowlingGame.new
        end

        it "should have a score of 0", negative: true do
            turns = 20
            pins = 0

            roll_many({ turns: turns, pins: pins, game: @game})

            expect(@game.score()).to eq(0)
        end
    end

    context "When testing BowlingGame class with a game of throwing 1's" do

        before(:each) do
            @game = BowlingGame.new
        end

        it "should have a score of 20", positive: true do
            turns = 20
            pins = 1

            roll_many({ turns: turns, pins: pins, game: @game})

            expect(@game.score()).to eq(20)
        end
    end
end
