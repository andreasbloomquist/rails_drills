class ArticlesController < ApplicationController

	def index
		@articles = Article.all
		render :index
	end

	def new
		@article = Article.new
		render :new
	end

	def create
		@article = Article.create(article_params)
		if @article.errors.messages == {}
			@user = current_user
			@user = @user.articles << @article
			flash[:notice] = "Article successfully created!"
			redirect_to article_path(@article.id)
		else 
			flash[:error] = "Hmm something went wrong, both a title and content are required."
			render :new
		end
	end

	def show
		@article = Article.find(params[:id])
		@current_user = current_user
		render :show
	end

	def edit
		@article = Article.find(params[:id])
		render :edit
	end

	def update
		@article = Article.find(params[:id])
		@article.update_attributes(article_params)
		redirect_to article_path(@article.id)
	end

	def destroy
		Article.destroy(params[:id])
		flash[:notice] = "Article successfully deleted"
		redirect_to	articles_path
	end


	private
	def article_params
		params.require(:article).permit(:title, :content)
	end
end
