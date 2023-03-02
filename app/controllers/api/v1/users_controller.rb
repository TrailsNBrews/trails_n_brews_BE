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
    
    headers = request.headers.to_h.deep_transform_keys(&:underscore).deep_transform_keys(&:upcase).deep_symbolize_keys
    @user = User.find_by(email: headers[:HTTP_AUTH_VAL])
    if @user
      # headers[:HTTP_AUTH_TOKEN] && @user&.google_token == headers[:HTTP_AUTH_TOKEN]
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
