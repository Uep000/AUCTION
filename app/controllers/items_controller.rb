class ItemsController < ApplicationController
  def show
    # Itemのモデル       :id
    @item = Item.find(params[:id])
  end
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to @item # 5
  end
  def edit
    @item = Item.find(params[:id])
  end  

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:neme, :price, :seller, :description, :email, :image_url)
  end

end
