class User < ApplicationRecord
	has_many :products
	has_many :bids
	validates :name, :email_address, presence: true
	validates_uniqueness_of :email_address 
end
