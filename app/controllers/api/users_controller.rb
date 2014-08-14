module API
  class UsersController < ApplicationController
    # GET /users
    # GET /users.json
    def index
      @users = User.all

      render json: @users
    end

    # GET /users/1
    # GET /users/1.json
    def show
      @user = User.find(params[:id])

      render json: @user
    end

    # POST /users
    # POST /users.json
    def create
      @user = User.new(tl_params)

      if @user.save
        render json: @user, status: :created
      else
         render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      @user = User.find(params[:id])

      if @user.update(tl_params)
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      @user = User.find(params[:id])
      @user.destroy

      head :no_content
    end
    
    private
    def tl_params
      params.require(:User).permit(:email, :category_id, :approved)
    end
  end
end