class RoomsController < ApplicationController
    def create
        @room = Room.new room_params
        if @room.save
            flash[:notice] = "success"
            redirect_to root_path
        else
            flash[:notice] = "Error #{@room.error.full_message.to_sentence}"
            redirect_to root_path
        end
    
    end

    def index
    end

    private

    def room_params
        params.require(:room).permit(:name)
    end
end
