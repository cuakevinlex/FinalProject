class PagesController < ApplicationController
  def index
  	@cafeteria = Cafeterium.all
		@stalls = Stall.last(3)
		@latest_reviews = Review.last(3) 
		@stall = Stall.all.sample(1)
		@count = 0
			if Food.last != nil
				while @food_of_the_day == nil and @count < 20
					@sam = Food.all.sample(1)
					if @sam[0].photo != ""
						@food_of_the_day = @sam[0]
					end
					@count +=1
				end
			end
	
  end 
  def about
  	@cafeteria = Cafeterium.all
  	@latest_reviews = Review.last(3)
  	@about = true
  end
end
