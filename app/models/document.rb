class Document < ActiveRecord::Base
	validates :doc_path, uniqueness: true
	has_and_belongs_to_many :categories
end
