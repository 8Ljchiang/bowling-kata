require_relative './frame_ten.rb'
require_relative './frame.rb'
require_relative './roll.rb'

class BowlingGame
    def initialize()
        @score = 0
        @frames = Array.new(9)
        @frames = @frames.map do |element|
            Frame.new
        end
        @roll_index = 0

        @frames.push(FrameTen.new)
    end

    def roll(pins)
        counter = 0
        while counter < @frames.length do
            if (!@frames[counter].is_full)
                newRoll = Roll.new(pins)
                @frames[counter].add_roll(newRoll)
                break
            end
            
            counter += 1
        end
        # for i in 0..@frames.length-1 do
        #     if (!@frames[i].is_full) 
        #         newRoll = Roll.new(pins)
        #         @frames[i].add_roll(newRoll)
        #         break
        #     end
        # end
    end

    def score
        score = 0
        frame_index = 0

        if @frames.length > 0
            while frame_index < @frames.length do
                if (frame_index < @frames.length - 1)
                    if(_is_strike(frame_index))
                        score += _get_current_frame_value(frame_index)
                        score += _get_next_n_rolls_value(frame_index, 2)
                    elsif(_is_spare(frame_index))
                        score += _get_current_frame_value(frame_index)
                        score += _get_next_n_rolls_value(frame_index, 1)
                    else
                        score += _get_current_frame_value(frame_index)
                    end
                elsif (frame_index == @frames.length - 1)
                    last_frame = @frames[frame_index]

                    score += last_frame.total_value
                end

                frame_index += 1
            end
        end

        return score
    end

    def _get_pin_value_from_roll_index(rolls, roll_index)
        value = 0
        
        if (roll_index < rolls.length && roll_index > 0)
            value += rolls[roll_index].pins
        end

        return value
    end

    def _get_next_n_pin_values_from_rolls(rolls, current_roll_index, n)
        value = 0

        for i in 1..n do
            value += _get_pin_value_from_roll_index(rolls, current_roll_index + i)
        end

        return value
    end

    def _get_current_frame_value(current_frame_index)
        value = 0
        
        if (current_frame_index < @frames.length)
            value += @frames[current_frame_index].total_value
        end
        
        return value
    end

    def _get_next_n_rolls_value(current_frame_index, n)
        value = 0
        cached_frame_index_counter = current_frame_index + 1
        roll_queue = []

        while roll_queue.length < n && cached_frame_index_counter < @frames.length do
            next_frame = @frames[cached_frame_index_counter]
            roll_queue.concat(next_frame.rolls)
            cached_frame_index_counter += 1
        end
        
        # if (roll_queue.length >= n)
        #     for i in 0..n-1 do
        #         value += roll_queue[i].pins
        #     end
        # else 
        #     roll_queue.each do |roll|
        #         value += roll.pins
        #     end
        # end 

        roll_queue[0..n-1].each do |roll|
            value += roll.pins
        end

        return value
    end

    def _is_strike(current_frame_index)
        frame = @frames[current_frame_index]
        return (frame.total_value == 10 && frame.roll_count == 1)
    end

    def _is_spare(current_frame_index)
        frame = @frames[current_frame_index]
        return (frame.total_value == 10 && frame.roll_count == 2)
    end
end