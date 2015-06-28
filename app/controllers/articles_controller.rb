class ArticlesController < ApplicationController
	include ArticlesHelper

	# Routing
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	# Actions
	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Article '#{@article.title}' has been birthed!"

		redirect_to article_path(@article)
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' has grown!"

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Article '#{@article.title}' has been murdered!"

		redirect_to articles_path
	end
end