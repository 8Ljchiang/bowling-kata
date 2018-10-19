class Frame
    def initialize(max_rolls = 2)
        @max_rolls = max_rolls
        @rolls = Array.new
    end

    def rolls
        return @rolls
    end

    def add_roll(roll)
        current_value = total_value
        if (@rolls.length <= @max_rolls)
            if (roll.pins == 10) 
                @max_rolls = 1
                @rolls.push(roll)
            elsif (current_value < 10 && roll.pins <= 10 - current_value)
                @rolls.push(roll)
            end

        #     end
        #     if (roll.pins < 10)
        #         @rolls.push(roll)
        #     elsif (roll.pins == 10 && @max_rolls == 2)
        #         @rolls.push(roll)
        #         @max_rolls = 1
        #     elsif (roll.pins == 10 && @max_rolls == 3)
        #         @rolls.push(roll)
        # else 
        #     puts "Roll value is greater than 10"
        # end
        end
    end

    def roll_count
        return @rolls.length
    end

    def get_roll_value(roll_index)
        if (roll_index <= @max_rolls && roll_index > 0)
            return @rolls[roll_index - 1].pins
        else 
            return 0
        end
    end

    def total_value
        value = 0
       
        @rolls.each do |roll|
            value += roll.pins
        end
       
        return value
    end

    def is_full
        return (@rolls.length >= @max_rolls)
    end
end
