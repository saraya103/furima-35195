class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :owner_check
  before_action :soldout_check

  def index
    @log = Log.new
  end

  def create
    @log = Log.new(order_params)
    if @log.valid?
      pay_item
      @log.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:log).permit(:postal_number, :prefecture, :city, :address, :building, :tel).merge(token: params[:token],
                                                                                                     user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def soldout_check
    @orderlog = OrderLog.find_by(item_id: @item.id)
    redirect_to root_path unless @orderlog.nil?
  end

  def owner_check
    redirect_to root_path if current_user.id == @item.user_id
  end
end
