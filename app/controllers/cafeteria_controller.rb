class CafeteriaController < ApplicationController
def create
	@cafeterium = Cafeterium.new
	@cafeterium.name = params[:cafeterium][:name]
	@cafeterium.capacity = params[:cafeterium][:capacity]
	@cafeterium.save!
	redirect_to :action => :index
  end
  def new
	@cafeterium = Cafeterium.new
  end

  def index
	@cafeteria = Cafeterium.all
  end

  def destroy
	@cafeterium = Cafeterium.find(params[:id])
	@cafeterium.destroy
	redirect_to :action => :index
  end

  def edit
	@cafeterium = Cafeterium.find(params[:id])
  end

	def update
	@cafeterium = Cafeterium.find(params[:id])
	@cafeterium.name = params[:cafeterium][:name]
	@cafeterium.capacity = params[:cafeterium][:capacity]
	@cafeterium.save!
	redirect_to :action => :index
	end

  def show
	@cafeterium = Cafeterium.find(params[:id])
  end
end
