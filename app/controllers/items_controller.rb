class ItemsController < ApplicationController
  before_action :find_room

  def index
  end

  def new
    @item = @room.items.new
  end

  def create
    @item = @room.items.new(item_params)
    if @item.save
        flash[:success] = "Saved new item."
        redirect_to room_path(@item.room_id)
    else
      render :new
    end
  end

  def edit
    @item = @room.items.find(params[:id])
  end

  def update
    @item = @room.items.find(params[:id])
    if @item.update(item_params)
      redirect_to room_items_path
    else
      render :edit
    end
  end

  def destroy
    @item = @room.items.find(params[:id])
    if @item.destroy
      flash[:success] = "Todo list item was deleted"
    else
      flash[:error] = "todo list item could not be deleted"
    end
    redirect_to room_items_path
  end

  private
    def find_room
      @room = Room.find(params[:room_id])
    end

    def item_params
    params.require(:item).permit(:name, :purchase_date, :value)
  end
end
