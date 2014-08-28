module API
  class NewsController < ApplicationController
    # GET /News
    # GET /News.json
    def index
      @news = News.all

      render json: @news
    end

    # GET /News/1
    # GET /News/1.json
    def show
      @News = News.find(params[:id])

      render json: @News
    end

    # POST /News
    # POST /News.json
    def create
      @News = News.new(tl_params)

      if @News.save
        render json: @News, status: :created
      else
         render json: @News.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /News/1
    # PATCH/PUT /News/1.json
    def update
      @News = News.find(params[:id])

      if @News.update(tl_params)
        head :no_content
      else
        render json: @News.errors, status: :unprocessable_entity
      end
    end

    # DELETE /News/1
    # DELETE /News/1.json
    def destroy
      @News = News.find(params[:id])
      @News.destroy

      head :no_content
    end
    
    private
    def tl_params
      params.require(:News).permit(:title, :body, :alias)
    end
  end
end