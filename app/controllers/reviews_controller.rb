class ReviewsController < ApplicationController
def create
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = @stall.reviews.new
	@review.user = params[:review][:user]
	@review.rating = params[:review][:rating]
	@review.comment = params[:review][:comment]
	@review.save!
	redirect_to cafeterium_stall_path(@cafeterium, @stall)
  end
  def new
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = @stall.reviews.new
  end

  def index
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@reviews = @stall.reviews.all
  end

  def destroy
	@review = Review.find(params[:id])
	@review.destroy
	redirect_to cafeterium_stall_path(@cafeterium, @stall)
  end

  def edit
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = Review.find(params[:id])
  end

	def update
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = Review.find(params[:id])
	@review.user = params[:review][:user]
	@review.rating = params[:review][:rating]
	@review.comment = params[:review][:comment]
	@review.save!
	redirect_to cafeterium_stall_path(@cafeterium, @stall)
	end

  def show
  	@review = Review.find(params[:id])
  end
end
