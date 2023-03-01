class Api::V1::UserAccomplishmentsController < ApplicationController

  def show
    accomplishments = UserAccomplishmentsFacade.accomplishments(params[:id])
    UserAccomplishmentsSerializer.accomplishments(accomplishments)
  end
end