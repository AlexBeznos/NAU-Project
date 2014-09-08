class Document < ActiveRecord::Base
  	validates :name, presence: true
	has_and_belongs_to_many :categories
  include Additions
end
