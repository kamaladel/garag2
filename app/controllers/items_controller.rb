class ItemsController < ApplicationController

  def index
  end

  def edit
  end

  def show
  	@items = Item.all
  end

  def new
  	@item = Item.new
  end
  def create

   @newitem = Item.new(item_params)
   @newitem.save  
   @visit = Visit.find(params[:visit_id])
   items = []
   items << @newitem
   @visit.items << items
   @visit.save
    respond_to do |format|
      format.html { redirect_to edit_visit_url(@visit), notice: 'Task was successfully destroyed.' }
      format.json { redirect_to edit_visit_url(@visit), notice: 'Task was successfully destroyed.' }
  end
  end

  def destroy
    @item = Item.find(params[:id])
    @visit = Visit.find(params[:visit_id])
    @item.destroy
        respond_to do |format|
      format.html
      format.json { render 'visits/destroy.js.erb' }
  end
end

  private
  def item_params
  params.require(:item).permit(:title,:description,:price)
  end
end
	


