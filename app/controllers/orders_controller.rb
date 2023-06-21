class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    ActiveRecord::Base.transaction do
      @order = Order.new
      @order.ordered_lists.build
      @items = Item.all.order(:created_at)
    end  
  end

  def create
    ActiveRecord::Base.transaction do
      @order = current_user.orders.build(order_params)
      unless @order.save
        raise ActiveRecord::Rollback
      end 
      @order.update_total_quantity
      # update_total_quantityメソッドは、注文された発注量を総量に反映するメソッドであり、Orderモデルに定義されています。
      redirect_to orders_path
    end  
  end

  private

  def order_params
    params.require(:order).permit(ordered_lists_attributes: [:item_id, :quantity])
  end

end