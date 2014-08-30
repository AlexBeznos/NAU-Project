class PagesController < ApplicationController
  def show
    @page = Pages.find_by(alias: params[:alias])
  end
end