class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: :edit
  before_action :set_item, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item)
          .permit(:title, :explanation, :category_id, :state_id, :delivery_fee_id, :region_id, :shipping_date_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    unless current_user.id == item.user_id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
