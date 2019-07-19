class ItemsController < ApplicationController
  
  def index
    @items = Item.paginate(page: params[:page]).search(params[:search])
  end
  
  def show
    @item = Item.find(params[:id])
    @company = @item.company
  end  
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(
      item: params[:item],
      price: params[:price],
      note: params[:note],
      image: params[:image],
      company_id: @current_company.id,    
    )
    if @item.save
      redirect_to items_url
    else
      render :new
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
      redirect_to items_url
    else
      render :edit
    end
  end
  
end
