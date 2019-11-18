require 'minitest/autorun'
require_relative "../src/controller/actions"
require_relative "../src/models/state"


class ActionsTest < Minitest::Test
    
    def setup
        @initial_state = Models::State.new(
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
    
    def test_move_snake
        expected_state = Models::State.new(
            Models::Snake.new([
                Models::Coord.new(2,1),
                Models::Coord.new(1,1)
            ]),
            Models::Food.new(4,4),
            Models::Grid.new(8,12),
            Models::Direction::DOWN,
            false
        )

        actual_state = Actions::move_snake(@initial_state)
        assert_equal actual_state, expected_state
    end

    def test_change_direction_invalid
        expected_state = @initial_state

        # As snake is going dow, it can't go up
        actual_state = Actions::change_direction(@initial_state, Models::Direction::UP)
        assert_equal actual_state, expected_state
    end

    def test_change_direction_valid
        expected_state = Models::State.new(
            Models::Snake.new([
                Models::Coord.new(1,1),
                Models::Coord.new(0,1)
            ]),
            Models::Food.new(4,4),
            Models::Grid.new(8,12),
            Models::Direction::LEFT,
            false
        )

        # As snake is going dow, it can't go up
        actual_state = Actions::change_direction(@initial_state, Models::Direction::LEFT)
        assert_equal actual_state, expected_state
    end
end