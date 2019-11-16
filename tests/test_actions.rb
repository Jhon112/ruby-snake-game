require 'minitest/autorun'
require_relative "../src/controller/actions"
require_relative "../src/models/state"


class ActionsTest < Minitest::Test
    def test_move_snake
        initial_state = Models::State.new(
            Models::Snake.new([
                Models::Coord.new(1,1),
                Models::Coord.new(0,1)
            ]),
            Models::Food.new(4,4),
            Models::Grid.new(8,12),
            Models::Direction::DOWN,
            false
        )

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

        actual_state = Actions::move_snake(initial_state)
        assert_equal actual_state, expected_state
    end
end