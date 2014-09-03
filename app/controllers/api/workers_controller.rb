module API
  class WorkersController < ApplicationController
    # GET /Workers
    # GET /Workers.json
    def index
      @workers = Worker.all

      render json: @workers
    end

    # GET /Workers/1
    # GET /Workers/1.json
    def show
      @worker = Worker.find(params[:id])

      render json: @worker
    end

    # POST /Workers
    # POST /Workers.json
    def create
      @worker = Worker.new(tl_params)

      if @worker.save
        render json: @worker, status: :created
      else
         render json: @worker.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /Workers/1
    # PATCH/PUT /Workers/1.json
    def update
      @worker = Worker.find(params[:id])

      if @worker.update(tl_params)
        head :no_content
      else
        render json: @worker.errors, status: :unprocessable_entity
      end
    end

    # DELETE /Workers/1
    # DELETE /Workers/1.json
    def destroy
      @worker = Worker.find(params[:id])
      @worker.destroy

      head :no_content
    end
    private
    def tl_params
      params.require(:worker).permit(:fio, :email, :category_id)
    end
  end
end