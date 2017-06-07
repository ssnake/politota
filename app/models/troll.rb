class Troll < ApplicationRecord
	validates :login, uniqueness: true
	has_many :comments, dependent: :destroy
end
