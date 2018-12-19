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

  def update
    @comment.update(comment_params)
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@comment.article) }
    end
  end

  def approve
    respond_to do |format|
      if @comment.update_attributes(comment_status_params)
        notice = 'ユーザ情報を更新しました'
        format.html { redirect_to article_path(@comment.article), notice: '更新しました' }

      else
        format.html { redirect_to article_path(@comment.article), notice: '更新に失敗しました'}
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end

    def comment_status_params
      params.require(:comment).permit(:status)
    end
end