class ItemsController < ApplicationController
  
  def index
    @items = Item.paginate(page: params[:page])
  end
  
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
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "#{@item.item}のデータを削除しました。"
    redirect_to items_url
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "商品情報を更新しました。"
      redirect_to @item
    else
      render :edit
    end
  end
  
  private
  
    def item_params
      params.require(:item).permit(:item, :note, :price)
    end
end
