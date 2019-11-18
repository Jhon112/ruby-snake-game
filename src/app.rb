require_relative "view/ruby2d"
require_relative "models/state"
require_relative "controller/actions"

class App
    def initialize
        @state = initial_state = Models::initial_state # call initial_state method from Models
        # This method creates a state instance who receives a snake, food, and grid objs
        # To create those objects we instance each class as well
        
    end

    def start
        # Instance Ruby2dView
        @view = View::Ruby2dView.new(self)

        # start uses main thread to do the render, because of that we need a new thread
        # to handle the render
        Thread.new { init_timer(view) }

        # start window
        view.start(@state)
    end

    def init_timer(view)
        loop do
            # trigger movement
            @state = Actions::move_snake(@state)
            # We call method render from view instance
            view.render(@state)
            sleep 0.5
        end
    end

    def send_action(action, params)
        new_state = Actions.send(action, @state, params)
        # hash is calculated based on object fields
        # if state hasn't change, state is the same due to it
        # being calculated based on the same info
        if new_state.hash != @state
            @state = new_state 
            @view.render(@state)
        end
    end
end

app = App.new
app.start