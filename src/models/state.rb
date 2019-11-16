# Game's state representation
module Models

    module Direction
        UP = :up
        RIGHT = :right
        DOWN = :down
        LEFT = :left
    end

    # Coords where our snake is
    class Coord < Struct.new(:row, :col)
    end

    # Represents the food
    class Food < Coord
    end

    # Represents the snake
    class Snake < Struct.new(:positions)
    end

    # Represents the grid (Window)
    class Grid < Struct.new(:rows, :cols)
    end

    # Class to hold together all of our instances this way we can access each instance
    # from a unique state
    class State < Struct.new(:snake, :food, :grid, :next_direction, :game_finished)
    end

    # class method to instance State, it create the instances for snake, food, grid, next_direction
    # and sets game_finished to false
    def self.initial_state
        Models::State.new(
            Models::Snake.new([
                Models::Coord.new(1,1),
                Models::Coord.new(0,1)
            ]),
            Models::Food.new(4,4),
            Models::Grid.new(8,12),
            Models::Direction::DOWN,
            false
        )
    end
end