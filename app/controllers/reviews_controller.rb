class ReviewsController < ApplicationController
def create
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = @stall.reviews.new
	@review.user = params[:review][:user]
	@review.rating = params[:review][:rating]
	@review.comment = params[:review][:comment]
	@review.published_at = DateTime.now
	@review.save!
	redirect_to cafeterium_stall_path(@cafeterium, @stall)
  end
  def new
	@cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = @stall.reviews.new
	@latest_reviews = Review.last(3) 
  end

  def index
    @cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = @stall.reviews.all
	@latest_reviews = Review.last(3) 
  end

  def destroy
 	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = Review.find(params[:id])
	@review.destroy
	redirect_to cafeterium_stall_path(@cafeterium, @stall)
  end

  def edit
  	@cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = Review.find(params[:id])
	@latest_reviews = Review.last(3) 
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
