class Stall < ActiveRecord::Base
belongs_to :cafeterium
has_many :foods
has_many :reviews
validates :name, uniqueness: true, presence: true
validates :description, presence: true
end
