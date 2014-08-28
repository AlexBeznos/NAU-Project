class NewsController < ApplicationController

  def index
    @news = News.all
  end

  def show
    @news = News.find_by(alias: params[:alias])
  end
end