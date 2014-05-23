class StallsController < ApplicationController
def create
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.new
	@stall.name = params[:stall][:name]
	@stall.description = params[:stall][:description]
	@stall.save!
	redirect_to :action => :index
  end
  def new
 	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = Stall.new
  end

  def index
  	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stalls = @cafeterium.stalls.all
  end

  def destroy
	@stall = Stall.find(params[:id])
	@stall.destroy
	redirect_to :action => :index
  end

  def edit
    @cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = Stall.find(params[:id])
  end

	def update
	@stall = Stall.find(params[:id])
	@stall.name = params[:stall][:name]
	@stall.description = params[:stall][:description]
	@stall.save!
	redirect_to :action => :index
	end

  def show
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
  end
end
