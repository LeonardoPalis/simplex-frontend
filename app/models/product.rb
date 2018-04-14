class Product < ApplicationRecord
	has_many :works
	has_many :resources
end
