class Food < ActiveRecord::Base
belongs_to :stall
validates :name, uniqueness: true, presence: true
validates :price, presence: true
end
