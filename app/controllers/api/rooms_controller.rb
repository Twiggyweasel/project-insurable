class Api::RoomsController < Api::ApiController
  skip_before_filter :verify_authenticity_token
  
  def index
    render json: Room.all
  end
  
  def show
    room = Room.find(params[:id])
    render json: room
  end
  
  def create
    room = Room.new(room_params)
    if room.save
      render status: 200, json:  {
        message: "Successfully created property",
        room: room
      }.to_json
    else
      render status: 422, json: {
        errors: room.errors
      }.to_json
    end
  end
  
  
  def update 
    room = Room.find(params[:id])
    if room.update(room_params)
      render status: 200, json:  {
        message: "Successfully updated property",
        room: room
      }.to_json
    else
      render status: 422, json: {
        errors: room.errors
      }.to_json
    end
  end
  
  def destroy
    room = Room.find(params[:id])
    room.destroy
    render status: 200, json:  {
        message: "Successfully deleted property",
      }.to_json
  end
  
  private 
    def room_params
      params.require(:room).permit(:name)
    end
end