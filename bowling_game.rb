class BowlingGame
    def initialize()
        @score = 0
        @rolls = []
        @roll_index = 0
    end

    def roll(pins)
        if (pins < 10)
            @roll_index += 1
            @rolls.push(pins)
        elsif (pins == 10)
            @roll_index += 1
            @rolls.push(pins)
        end
    end

    def score
        score = 0
        frame_index = 0

        if @rolls.length > 0
            while frame_index < @rolls.length do
                if(_is_strike(frame_index))
                    score += _get_current_frame_value(frame_index)
                    score += _get_next_two_rolls_value(frame_index)

                    if (frame_index == @rolls.length - 4 && frame_index < @rolls.length)
                        frame_index += 2
                    else
                        frame_index += 1
                    end
                elsif(_is_spare(frame_index))
                    score += _get_current_frame_value(frame_index)
                    score += _get_next_two_rolls_value(frame_index)
                    frame_index += 2
                else
                    score += _get_current_frame_value(frame_index)
                    frame_index += 1
                end
            end
        end

        return score
    end

    def _get_current_frame_value(current_frame_index)
        value = 0
        
        if (current_frame_index < @rolls.length)
            value += @rolls[current_frame_index]
        end
        
        return value
    end

    def _get_next_two_rolls_value(current_frame_index)
        value = 0
        value += _get_current_frame_value(current_frame_index + 1)
        value += _get_current_frame_value(current_frame_index + 2)
        return value
    end

    def _is_strike(current_frame_index)
        return (@rolls[current_frame_index] == 10)
    end

    def _is_spare(current_frame_index)
        if (current_frame_index < @rolls.length - 1)
            return (@rolls[current_frame_index] + @rolls[current_frame_index] == 10)
        else
            return false
        end
    end

    # def _was_strike(current_frame_index)
    #     return (@rolls[current_frame_index - 2] == 10)
    # end

    # def _was_spare(current_frame_index)
    #     return ((@rolls[current_frame_index - 1] + @rolls[current_frame_index - 2]) == 10)
    # end
end