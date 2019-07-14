class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end  
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = '新規登録に成功しました。'
      redirect_to @item
    else
      render:new
    end
  end
  
  private
  
    def item_params
      params.require(:item).permit(:item, :note, :price)
    end
end
