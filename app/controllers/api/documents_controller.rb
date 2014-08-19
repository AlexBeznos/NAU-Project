module API
  class DocumentsController < ApplicationController
    # GET /documents
    # GET /documents.json
    def index
      @documents = Document.all

      render json: @documents
    end

    # GET /documents/1
    # GET /documents/1.json
    def show
      @document = Document.find(params[:id])

      render json: @document
    end

    # POST /documents
    # POST /documents.json
    def create
      @document = Document.new(tl_params)

      if @document.save
        render json: @document, status: :created
      else
        render json: @document.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /documents/1
    # PATCH/PUT /documents/1.json
    def update
      @document = Document.find(params[:id])
      @document.name = params[:name] if params[:name]

      if params[:file]
        @document.file_path(params[:file])
      end

      hash = {
        doc_path: @document.doc_path
      }
      if @document.save
        render json: hash, status: 200
      else
        render json: @document.errors, status: :unprocessable_entity
      end
    end

    # DELETE /documents/1
    # DELETE /documents/1.json
    def destroy
      @document = Document.find(params[:id])
      @document.destroy

      head :no_content
    end
    
    private
    def tl_params
      params.require(:document).permit(:name, :doc_path)
    end
  end
end