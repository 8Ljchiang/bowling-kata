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
            @roll_index ++
            @rolls.push(pins)
        end
    end

    def score
        score = 0

        if @rolls.length > 0
            for frame in 0..@rolls.length-1 do
                
                score += @rolls[frame]
                if (frame > 1 && frame % 2 == 0 && frame < @rolls.length)
                    #if strike
                    if (@rolls[frame - 2] == 10)
                        score += @rolls[frame - 1] + @rolls[frame] 
                    # if spare
                    elsif (_was_spare(frame))
                        score += @rolls[frame]
                    end
                end
                
                # puts i.to_s + " :: " + @rolls[i].to_s + ' :: ' + score.to_s
            end
        end

        return score
    end

    def _was_spare(current_frame_index)
        return ((@rolls[current_frame_index - 1] + @rolls[current_frame_index - 2]) == 10)
    end
end