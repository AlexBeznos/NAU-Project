class CategorySerializer < ApplicationSerializer
	attributes :id, :name
	has_many :users
end