class HomesController < ApplicationController
  skip_before_action :configure_permitted_parameters, if: :devise_controller?


  def show
    @q = Article.article_publish.ransack(params[:q])
    @articles = @q.result
  end
end