class LogsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @log_order = LogOrder.new
  end

  def create
    @log_order = LogOrder.new(log_params)
    if @log_order.valid?
      @log_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def log_params
    params.require(:log_order)
    .permit(:postcode, :region_id, :city, :address, :building_name, :phone_number)
    .merge(user_id: current_user.id, item_id: params.require(:item_id))
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
