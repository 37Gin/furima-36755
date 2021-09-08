class LogsController < ApplicationController
  def index
    @log_order = LogOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
  end
end
