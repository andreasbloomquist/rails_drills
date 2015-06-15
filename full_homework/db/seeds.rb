require 'ffaker'

(1..10).each do |x|
	user_params = {}
	user_params[:email] = "#{x}#{FFaker::Internet.email}"
	user_params[:password] = "testtest"
	user_params[:password_confirmation] = user_params[:password]
	user_params[:first_name] = FFaker::Name.first_name
	user_params[:last_name] = FFaker::Name.last_name
	new_user = User.create(user_params)

	(1..10).each do

		new_article = Article.new
		new_article.title = FFaker::HipsterIpsum.words(rand(8)+2).join(" ")
		new_article.content = FFaker::HipsterIpsum.paragraphs(1+ rand(4)).join("\n")
		new_article.save
		new_user.articles.push new_article
	end
end