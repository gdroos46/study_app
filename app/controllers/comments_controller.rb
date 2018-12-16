class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def show; end
  def edit; end

  def create
    @comment.article_id = params[:article_id]
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@comment.article), notice: '登録に成功しました' }
      else
        format.html { redirect_to article_path(@comment.article), notice: '登録に失敗しました' }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@comment.article) }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end