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
    @user = User.find_by(email: request.headers[:HTTP_AUTH_VAL])
    if @user
      render json: UserSerializer.format_user(@user)
    else
      render json: { "errors": "Unable to locate or authenticate user" }, status: :not_found
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
