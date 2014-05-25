class FoodsController < ApplicationController

	def create
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@food = @stall.foods.new
	@food.name = params[:food][:name]
	@food.price = params[:food][:price]
	@food.photo = params[:food][:photo]
	@food.save!
	redirect_to cafeterium_stall_path(@cafeterium, @stall)
  end
  def new
  	@cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@food = @stall.foods.new
	@latest_reviews = Review.last(3) 
  end

  def index
  	@cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@foods = @stall.foods.all
	@latest_reviews = Review.last(3) 
  end

  def destroy
  	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@food = Food.find(params[:id])
	@food.destroy
	redirect_to cafeterium_stall_path(@cafeterium, @stall)
  end

  def edit
  	@cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@food = Food.find(params[:id])
	@latest_reviews = Review.last(3) 
  end

	def update
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@food = Food.find(params[:id])
	@food.name = params[:food][:name]
	@food.price = params[:food][:price]
	@food.photo = params[:food][:photo]
	@food.save!
	redirect_to cafeterium_stall_path(@cafeterium, @stall)
	end

  def show
  	@food = Food.find(params[:id])
  	
  end
end
