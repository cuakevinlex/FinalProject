class CafeteriaController < ApplicationController
def create
	@cafeterium = Cafeterium.new
	@cafeterium.name = params[:cafeterium][:name]
	@cafeterium.capacity = params[:cafeterium][:capacity]
	if @cafeterium.save
	redirect_to :action => :index
	else
	redirect_to :action => :new
	end
  end
  def new
  	@cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.new
	@latest_reviews = Review.last(3) 
  end

  def index
	@cafeteria = Cafeterium.all
	@latest_reviews = Review.last(3) 
  end

  def destroy
	@cafeterium = Cafeterium.find(params[:id])
	@cafeterium.destroy
	redirect_to :action => :index
  end

  def edit
	@cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.find(params[:id])
	@latest_reviews = Review.last(3) 
  end

	def update
	@cafeterium = Cafeterium.find(params[:id])
	@cafeterium.name = params[:cafeterium][:name]
	@cafeterium.capacity = params[:cafeterium][:capacity]
	if @cafeterium.save
	redirect_to :action => :index
	else
	redirect_to :action => :edit
	end
	end

  def show
  	@cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.find(params[:id])
	@stalls = @cafeterium.stalls.all.sort! { |x,y| x.name <=> y.name } 
	@latest_reviews = Review.last(3) 
  end
end
