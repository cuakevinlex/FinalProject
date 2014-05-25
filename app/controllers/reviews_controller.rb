class ReviewsController < ApplicationController
def create
	@cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = @stall.reviews.new
	@review.user = params[:review][:user]
	@review.rating = params[:review][:rating]
	@review.comment = params[:review][:comment]
	@review.published_at = DateTime.now
	if @review.save
	redirect_to cafeterium_stall_path(@cafeterium, @stall)
	else
	redirect_to :action => :new
	end
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
	@cafeteria = Cafeterium.all
	@cafeterium = Cafeterium.find(params[:cafeterium_id])
	@stall = @cafeterium.stalls.find(params[:stall_id])
	@review = Review.find(params[:id])
	@review.user = params[:review][:user]
	@review.rating = params[:review][:rating]
	@review.comment = params[:review][:comment]
	if @review.save
	redirect_to cafeterium_stall_path(@cafeterium, @stall)
	else
	redirect_to :action => :edit
	end
	end
  def show
  	@review = Review.find(params[:id])
  end
end
