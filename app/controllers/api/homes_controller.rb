class Api::HomesController < Api::ApiController
  skip_before_filter :verify_authenticity_token
  
  def index
    render json: Home.all
  end
  
  def show
    home = Home.find(params[:id])
    render json: home
  end
  
  def create
    home = Home.new(home_params)
    if home.save
      render status: 200, json:  {
        message: "Successfully created property",
        home: home
      }.to_json
    else
      render status: 422, json: {
        errors: home.errors
      }.to_json
    end
  end
  
  
  def update 
    home = Home.find(params[:id])
    if home.update(home_params)
      render status: 200, json:  {
        message: "Successfully updated property",
        home: home
      }.to_json
    else
      render status: 422, json: {
        errors: home.errors
      }.to_json
    end
  end
  
  def destroy
    home = Home.find(params[:id])
    home.destroy
    render status: 200, json:  {
        message: "Successfully deleted property",
      }.to_json
  end
  
  private 
    def home_params
      params.require(:home).permit(:name, :value, :purchase_date)
    end
end
