class HomesController < ApplicationController
  skip_before_action :configure_permitted_parameters, if: :devise_controller?


  def show
    @articles = Article.all
  end
end