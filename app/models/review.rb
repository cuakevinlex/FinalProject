class Review < ActiveRecord::Base
belongs_to :stall

validates :rating, presence: true
validates :comment, presence: true
end
