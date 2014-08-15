class UserSerializer < ApplicationSerializer
  attributes :id, :email, :approved, :category_id
end
