# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article]
    @article = Article.new(article_params)
    @article.user_id = 1
    if @article.save
      flash[:notice] = 'Article was created successfully.' # sending success message by flash
      redirect_to article_path(@article) # prefix:article => show.html.erb
    else
      render 'new', status: :unprocessable_entity # new.html erb
    end

    # render plain: @article.inspect
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was edited successfully.' # sending success message by flash
      redirect_to article_path(@article) # show
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path # prefix:articles => index.html.erb
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    # params[:article]
    params.require(:article).permit(:title, :description)
  end
end
