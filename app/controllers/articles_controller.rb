class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  load_and_authorize_resource
  load_and_authorize_resource through: :user

  def show
  end

  def new; end
  def edit; end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path notice: '登録に成功しました' }
      else
        format.html { render :new, notice: '登録に失敗しました' }
      end
    end
  end
  def update
    @article.update(article_params)
    if @article.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:name, :description, :image, :status)
    end

end