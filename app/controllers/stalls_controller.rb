class StallsController < ApplicationController
def create
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.new
	@stall.name = params[:stall][:name]
	@stall.description = params[:stall][:description]
	if @stall.save
	redirect_to :action => :index
	else
	redirect_to :action => :new
	end
  end
  def new
  	@cafeteria = Cafeterium.all
 	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = Stall.new
	@latest_reviews = Review.last(3) 
  end

  def index
  	@cafeteria = Cafeterium.all
  	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stalls = @cafeterium.stalls.all
	@latest_reviews = Review.last(3) 
  end

  def destroy
	@stall = Stall.find(params[:id])
	@stall.destroy
	redirect_to :action => :index
  end

  def edit
    	@cafeteria = Cafeterium.all
    @cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = Stall.find(params[:id])
	@latest_reviews = Review.last(3) 
  end

	def update
	@stall = Stall.find(params[:id])
	@stall.name = params[:stall][:name]
	@stall.description = params[:stall][:description]
	if @stall.save
	redirect_to :action => :index
	else
	redirect_to :action => :edit
	end
	end

  def show
    @cafeteria = Cafeterium.all
  	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = Stall.find(params[:id])
	@reviews = @stall.reviews.all
	@foods = @stall.foods.all
	@number_of_reviews = 0
	@total = 0
	
	@reviews.each do |review|
		@total += review.rating
		@number_of_reviews +=1
	end
	@average = @total.to_f/@number_of_reviews.to_f
	@latest_reviews = Review.last(3) 
  end
end
