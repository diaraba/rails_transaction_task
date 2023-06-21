class ItemsController < ApplicationController
  before_action :admin_required, only: [:index]

  def index
    @items = Item.all.order(:created_at)
  end

  private

  def admin_required
    redirect_to orders_path unless current_user.admin?
  end
end
