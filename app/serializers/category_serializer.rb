class CategorySerializer < ApplicationSerializer
	attributes :id, :name, :approved
	has_many :users
end