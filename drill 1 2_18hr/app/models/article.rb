class Article < ActiveRecord::Base
	belongs_to :users

	validates_presence_of :title, :content
end
