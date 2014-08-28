class HomeController < ApplicationController
  before_filter :authenticate_admin!, only: [:administration]

  def index
  end

  def show
    @documents = Category.find(params[:id]).documents
  end

  def smq
  	@documents = Document.where(open: true)
  end

  def external
  end

  def administration
  	render layout: 'admin'
  end
end
