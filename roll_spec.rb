require_relative './roll.rb'

RSpec.describe Roll do
    context "when no args are passed to Roll when initialized" do

        before(:each) do
            @roll = Roll.new()
        end

        it "should have a default pins value of 0", positive: true do
            expect(@roll.pins).to eq(0)
        end
    end

    context "when pins are passed to Roll when iniitalized pins = 4" do

        before(:each) do
            @roll = Roll.new(4)
        end
        
        it "should have a pins value of 4", positive: true do
           expect(@roll.pins).to eq(4) 
        end
    end
end
