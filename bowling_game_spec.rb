# require_relative './bowling_game.rb'
require_relative './bowling_game_refac.rb'

RSpec.describe(BowlingGame) do

    # Testing helper for rolling pins 'n' number of times.
    def roll_many(args={})
        turns = args[:turns]
        
        for i in 1..turns do
            args[:game].roll(args[:pins])
        end
    end

    def roll_spare(args={})
        args[:game].roll(5)
        args[:game].roll(5)
    end

    def roll_strike(args={})
        args[:game].roll(10)
    end

    context "When testing BlowingGame glass" do
        it "should initialize a new object", initialize: true do
            game = BowlingGame.new
            expect(game).to_not be(nil)
        end
    end

    context "When testing BowlingGame class with a gutter game" do
        
        before(:each) do
            @game = BowlingGame.new
        end

        it "should have a score of 0", positive: true do
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
    
    context "When testing BowlingGame class with a game that throws a spare" do
        
        before(:each) do
            @game = BowlingGame.new
        end

        it "should roll one spare in the game and have a score of 16", positive: true do
            roll_spare({ game: @game })
            @game.roll(3)
            roll_many({ turns: 17, pins: 0, game: @game })

            expect(@game.score).to eq(16)
        end
    end

    context "When testing BowlingGame class with a game that throws a strike" do

        before(:each) do
            @game = BowlingGame.new
        end

        it "should roll one strike in the game and have a score of 24", positive: true do
            roll_strike({ game: @game })
            @game.roll(3)
            @game.roll(4)
            roll_many({ turns: 16, pins: 0, game: @game })

            expect(@game.score).to eq(24)
        end
    end

    context "When testing BowlingGame class with a perfect game of all strikes" do
        
        before(:each) do
            @game = BowlingGame.new
        end

        it "should roll all strikes and have a score of 300", positive: true do
            roll_many({ turns: 12, pins: 10, game: @game })

            expect(@game.score).to eq(300)
        end
    end
end
