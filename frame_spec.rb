require_relative './frame.rb'
require_relative './roll.rb'

RSpec.describe(Frame) do    
    context "When 0 rolls have been added" do 
        before(:all) do
            @frame = Frame.new
        end

        it "should return 0 when 'roll_count' methods is called" do
            expect(@frame.roll_count).to eq(0)
        end

        it "should return 0 when 'total_value' method is called" do
            expect(@frame.total_value).to eq(0)
        end

        it "should return false when 'is_full' method is called" do
            expect(@frame.is_full).to be(false)
        end
    end

    context "When adding 1 roll (10)" do
        before(:all) do
            @roll = Roll.new(10)
            @frame = Frame.new
            @frame.add_roll(@roll)
        end
        
        it "should return an array with 1 roll when 'rolls' method is called" do
            expect(@frame.rolls).to be_an_instance_of(Array)
        end

        it "should return 1 when 'roll_count' method is called" do
            expect(@frame.roll_count).to eq(1)
        end

        it "should return 10 as 'total' value" do
            expect(@frame.total_value).to eq(10)
        end

        it "should return true when 'is_full' method is called" do
            expect(@frame.is_full).to eq(true)
        end
    end

    context "When adding 2 rolls (2 and 4) using add_roll" do
        before(:all) do
            @roll1 = Roll.new(2)
            @roll2 = Roll.new(4)
            @frame = Frame.new
            @frame.add_roll(@roll1)
            @frame.add_roll(@roll2)
        end

        it "should return an array with 2 rolls when 'rolls' method is called" do
            expect(@frame.rolls).to be_an_instance_of(Array)
        end

        it "should return 2 when 'roll_count' method is called" do
            expect(@frame.roll_count).to eq(2)
        end

        it "should return 6 when 'total_value' method is called" do
            expect(@frame.total_value).to eq(6)
        end

        it "should return true when 'is_full' method is called" do
            expect(@frame.is_full).to be(true)
        end
    end
end