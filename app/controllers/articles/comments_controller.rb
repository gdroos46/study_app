class Articles::CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  load_and_authorize_resource :article

  def show; end
  def edit; end

  def create
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@article), notice: '登録に成功しました' }
      else
        format.html { redirect_to article_path(@article), notice: '登録に失敗しました' }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end