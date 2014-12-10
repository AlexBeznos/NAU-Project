module API
  class PagesController < ApplicationController
    include AdminChecker
    before_action :check_admin

    # GET /Pages
    # GET /Pages.json
    def index
      @pages = Pages.all

      render json: @pages
    end

    # GET /Pages/1
    # GET /Pages/1.json
    def show
      @pages = Pages.find(params[:id])

      render json: @pages
    end

    # POST /Pages
    # POST /Pages.json
    def create
      @pages = Pages.new(tl_params)

      if @pages.save
        render json: @pages, status: :created
      else
        render json: @pages.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /Pages/1
    # PATCH/PUT /Pages/1.json
    def update
      @pages = Pages.find(params[:id])

      if @pages.update(tl_params)
        head :no_content
      else
        render json: @pages.errors, status: :unprocessable_entity
      end
    end

    # DELETE /Pages/1
    # DELETE /Pages/1.json
    def destroy
      @pages = Pages.find(params[:id])
      @pages.destroy

      head :no_content
    end
    private
    def tl_params
      params.require(:page).permit(:page_content, :alias, :name)
    end
  end
end