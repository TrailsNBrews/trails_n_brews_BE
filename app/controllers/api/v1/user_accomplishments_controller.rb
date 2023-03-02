class Api::V1::UserAccomplishmentsController < ApplicationController

  def show
    accomplishments = UserAccomplishmentsFacade.accomplishments(params[:id])
    render json: UserAccomplishmentsSerializer.accomplishments(accomplishments)
  end
end