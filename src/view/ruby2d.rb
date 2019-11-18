require "ruby2d"

module View
    class Ruby2dView
        def initialize
            @pixel_size = 50
        end

        # sets window attributes

        def start(state)
            extend Ruby2D::DSL
            set(
                title: "Snake",
                width: @pixel_size * state.grid.cols,
                height: @pixel_size * state.grid.rows
            )
            show
        end
        # call render_snake and food methods to display snake and food objs on window
        def render(state)
            render_snake(state)
            render_food(state)
        end

        private

        # assisgn the instance to snake var
        # iterate over snake's positions attribute and create a square for each
        # Note that positions is an array of Coord instances
        def render_snake(state)
            @snake_positions.each(&:remove) if @snake_positions
            
            extend Ruby2D::DSL
            snake = state.snake
            @snake_positions = snake.positions.map do |pos|
                Square.new(
                    color: 'green',
                    x: pos.col * @pixel_size,
                    y: pos.row * @pixel_size,
                    size: @pixel_size
                )
            end    
        end

        # assign food instance to food variable
        # create a square according to food attributes
        def render_food(state)
            @food.remove if @food
            extend Ruby2D::DSL
            food = state.food
            @food = Square.new(
                color: 'white',
                x: food.col * @pixel_size,
                y: food.row * @pixel_size,
                size: @pixel_size
            )
        end
    end
end