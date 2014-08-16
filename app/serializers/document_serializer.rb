class DocumentSerializer < ApplicationSerializer
  attributes :id, :name, :doc_path
  has_many :categories
end
