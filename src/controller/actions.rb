# In charge of modifying the state of our app
module Actions
    # It's in chage of calculatinf the new position and checking if it's valid.
    # Returns the state edited
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = calc_next_position(state)
        # check if next_direction is valid
        # if not, game ends
        # if true, moves snake
        if position_is_valid?(state, next_position)
            move_snake_to(state, next_position)
        else
            end_game(state)
        end
    end

    private
      
    def self.calc_next_position(state)
        curr_position = state.snake.positions.first
        case state.next_direction
        when Models::Direction::UP
            # decrease row
            return Models::Coord.new(
                curr_position.row - 1,
                curr_position.col
            )
        when Models::Direction::RIGHT
            # increase col
            return Models::Coord.new(
                curr_position.row,
                curr_position.col + 1
            )
        when Models::Direction::DOWN
            # increase row
            return Models::Coord.new(
                curr_position.row + 1,
                curr_position.col
            )
        when Models::Direction::LEFT
            # decrease col
            return Models::Coord.new(
                curr_position.row,
                curr_position.col - 1
            )
        end
    end

    def self.position_is_valid?(state, position)
        # check new position is in grid
        is_invalid = ((position.row >= state.grid.rows || position.row < 0) ||
        (position.col >= state.grid.cols || position.col < 0))
            
        return false if is_invalid
        
        # check it does not overlap the next position
        return !(state.snake.positions.include? position)
    end

    def self.move_snake_to(state, next_position)
        # as snake's head is the first position, we need to pop the last position,
        # and add new position
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        return state
    end
    
    def self.end_game(state)
        state.game_finished = true
        return state
    end
end