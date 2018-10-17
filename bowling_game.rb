class BowlingGame
    def initialize()
        @score = 0
        @rolls = []
        @roll_index = 0
    end

    def roll(pins)
        @rolls.push(pins)
        @score = @score + pins
    end

    def score
        score = 0

        if @rolls.length > 0
            for i in 0..@rolls.length-1 do
                
                score += @rolls[i]
            
                # if spare
                if (i > 1 && i%2 == 0 && i < @rolls.length && @rolls[i - 1] + @rolls[i - 2] == 10)
                    score += @rolls[i]
                end
                
                # puts i.to_s + " :: " + @rolls[i].to_s + ' :: ' + score.to_s
            end
        end

        return score
    end
end