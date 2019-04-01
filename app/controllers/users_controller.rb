class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users/1
  def show
    if @user
      user_data = {
        "message": "User details by user_id",
        "user": {
          "user_id": @user.user_id,
          "nickname": @user.nickname,
          "comment": @user.comment
          }
      }
      render :json => user_data 
    else
      err_data = {
        "message": @user.errors
      }
      render :json => err_data
    end

  end

  # POST /signup
  def signup
    @user = User.new(user_params)

    if @user.save
      user_data = {
        "message": "Account successfully created",
        "user": {
          "user_id": params[:user_id],
          "nickname": params[:user_id]
        }
      }
      render :json => user_data
      # render json: @user
    else
      err_data = {
        "message": "Account creation failed",
        "cause": @user.errors.full_messages[0]
      }
      render :json => err_data
      # render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      user_data = {
        "message": "User successfully updated",
        "recipe": [
          {
            "nickname": @user.nickname,
            "comment":  @user.comment
          }
        ]
      }
    else
      render :json => user_data
      # render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(user_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:user_id, :nickname, :password, :comment)
    end
end
