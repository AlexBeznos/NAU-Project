class News < ActiveRecord::Base
	validates :alias, uniqueness: true, presence: true
end
