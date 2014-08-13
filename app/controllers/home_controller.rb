class HomeController < ApplicationController
  def index
  end

  def show
    @documents = Category.find(params[:id]).documents
  end
end
