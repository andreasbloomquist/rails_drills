require 'rails_helper'

describe Article, type: :model do
	context "validation" do
		let (:article) do
			Article.new({
				title: "Sweet article",
				content: "Some stuff",
				user_id: 1
				})
		end

		it "validates presence of title" do
			article.title = nil
			expect(article).not_to be_valid
		end

		it "validates presence of content" do
			article.content = nil
			expect(article).not_to be_valid
		end
	end
end