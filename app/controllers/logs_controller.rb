class LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index
  before_action :check_stock

  def index
    @log_order = LogOrder.new
  end

  def create
    @log_order = LogOrder.new(log_params)
    if @log_order.valid?
      pay_item
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
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: log_params[:token],
      currency: 'jpy'
    )
  end

  def check_stock
    redirect_to root_path if @item.log.present?
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end
end
