class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  private

  def item_params
    params.require(:item)
          .permit(:title, :explanation, :category_id, :state_id, :delivery_fee_id, :region_id, :shipping_date_id, :price, :image)
          .merge(user_id: current_user.id)
  end
end
