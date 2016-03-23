class VisitsController < ApplicationController


  def new

      @owner = Owner.new
      @visit = @owner.visits.new
      @found_owner = true
  end


  def find_car

    @owner = Owner.find_by(car_number: params[:car_id].to_i)
    if !@owner.nil?
    @visit = @owner.visits.new
    @found_owner = true

    render 'find_car'
  else
    @owner = Owner.new
    @visit = @owner.visits.new
    @found_owner = false
    render 'new'
  end


  end


  def create
  @owner = Owner.new(owner_params)
  @owner.save
  @visit = @owner.visits.new(visit_params)
  @visit.save
  @items = @visit.items
  render '_show'
  end


def create_visit_owner

@owner = Owner.find(params[:id])
@visit = @owner.visits.new(visit_params)
@visit.save
@items = @visit.items
  render '_show'

end

def search_form
end

    def index
  	  @visits = Visit.all
      @owners = Owner.all
    end

    def show
       @visit = Visit.find(params[:id])
       @items = @visit.items
       @owner = @visit.owner
    end

   def edit
    @visit = Visit.find(params[:id])
    @items = @visit.items
    @owner = @visit.owner
    @newitem = Item.new
   end

def destroy_item_visit

    @item = Item.find(params[:item_id])
    @visit = Visit.find(params[:id])
    @items = @visit.items
    @visit.items.destroy(@item)
    @visit.save

  end


def update
  respond_to do |format|

@visit = Visit.find_by(id: params[:id])
@visit.owner.update_attributes(owner_params) 
@visit.update_attributes(visit_params)

@owner = @visit.owner
@items = @visit.items
format.js 
end
end

def car_visits

  @visit = Visit.find_by(id: params[:id])

  @owner = Owner.find_by(car_number: @visit.owner.car_number.to_i) 
  

  @visits = @owner.visits.order(created_at: :desc)
end


def status

@visit = Visit.find(params[:id])

@visit.open = !@visit.open
@visit.save
end


end



def new_item_visit
@visit = Visit.find_by(id: params[:id])
@newitem  = Item.new
end

def create_item_visit
  @newitem = Item.new(item_params)
  @newitem.save  
  @visit = Visit.find(params[:id])
  @visit.items << @newitem
  @visit.save
end





  
    private

def owner_params
  params.require(:owner).permit(:name,:car_number,:car_year,:car_type,:car_model,:car_km,:phone,:email,:car_next_service_date)
end 

private
def visit_params
  params.require(:visit).permit(:notes,:owner_id)
end





  def destroy
  end




