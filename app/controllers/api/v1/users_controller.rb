class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { "success": "User added successfully" }, status: 201
    else
      render json: { "errors": user.errors.full_messages.to_sentence }, status: 400
    end
  end

  def show
    @user = User.find(params[:google_token])
    unless @user
      render json: { "errors": 'Unable to locate user' }, status: :not_found
    else
      render json: UserSerializer.format_user(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :google_id,
      :google_token
    )
  end
end
