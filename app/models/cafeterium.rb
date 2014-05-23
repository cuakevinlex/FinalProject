class Cafeterium < ActiveRecord::Base
has_many :stalls
validates :name, uniqueness: true, presence: true
validates :capacity, presence: true
end
