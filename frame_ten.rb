require_relative './frame.rb'

class FrameTen < Frame
    def initialize(max_size = 3)
        super(max_size)
    end

    def add_roll(roll)
        current_value = total_value

        if (@rolls.length <= @max_rolls)
            if (@rolls.length == 0)
                @rolls.push(roll)
            elsif (@rolls.length == 1)
                if (current_value == 10)
                    @rolls.push(roll)
                elsif (roll.pins <= 10 - current_value)
                    @rolls.push(roll)
                    @max_rolls -= 1
                end
            else
                @rolls.push(roll)
            end
        end
    end
end

