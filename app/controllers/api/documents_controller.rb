module API
  class DocumentsController < ApplicationController
    # GET /documents
    # GET /documents.json
    def index
      @documents = document.all

      render json: @documents
    end

    # GET /documents/1
    # GET /documents/1.json
    def show
      @document = document.find(params[:id])

      render json: @document
    end

    # POST /documents
    # POST /documents.json
    def create
      @document = document.new(tl_params)

      if @document.save
        render json: @document, status: :created
      else
         render json: @document.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /documents/1
    # PATCH/PUT /documents/1.json
    def update
      @document = document.find(params[:id])

      if @document.update(tl_params)
        head :no_content
      else
        render json: @document.errors, status: :unprocessable_entity
      end
    end

    # DELETE /documents/1
    # DELETE /documents/1.json
    def destroy
      @document = document.find(params[:id])
      @document.destroy

      head :no_content
    end
    
    private
    def tl_params
      params.require(:document).permit(:name, :doc_path)
    end
  end
end