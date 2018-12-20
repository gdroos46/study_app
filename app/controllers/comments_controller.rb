class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  load_and_authorize_resource :article

  def show; end
  def edit; end

  def create
    @comment.article = @article
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        NoticeMailer.sendmail_confirm(@comment.user, @comment.article).deliver_now
        format.html { redirect_to article_path(@article), notice: '登録に成功しました' }
      else
        format.html { redirect_to article_path(@article), notice: '登録に失敗しました' }
      end
    end
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
    end
  end

  def approve
    # jsによるstatus変更で使用 selectのやつ
    # respond_to do |format|
    #   if @comment.update_attributes(comment_status_params)
    #     notice = 'ユーザ情報を更新しました'
    #     format.html { redirect_to article_path(@comment.article), notice: '更新しました' }

    #   else
    #     format.html { redirect_to article_path(@comment.article), notice: '更新に失敗しました'}
    #   end
    # ends
    @comment.status = params[:status]
    if @comment.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end

    # def comment_status_params
    #   params.require(:comment).permit(:status)
    # end
end