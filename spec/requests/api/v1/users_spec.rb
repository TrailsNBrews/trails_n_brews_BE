require 'rails_helper'

RSpec.describe 'Users API' do
  describe '#Create' do
    it 'can create a new user' do
      user_params = ({
        email: 'jimmyjoe@gmail.com',
        first_name: 'Jimmy',
        last_name: 'Joe',
        google_id: '1234',
        google_token: '474E5a5s12'
      })
      headers = { "CONTENT_TYPE" => "application/json" }
      post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)
      created_user = User.last

      expect(response).to be_successful
      expect(created_user.email).to eq(user_params[:email])
      expect(created_user.first_name).to eq(user_params[:first_name])
      expect(created_user.last_name).to eq(user_params[:last_name])
      expect(created_user.google_id).to eq(user_params[:google_id])
      expect(created_user.google_token).to eq(user_params[:google_token])
    end

    it 'notifies of errors due to missing attributes' do
      user_params = ({
        email: 'jennyjoe@gmail.com',
        first_name: 'Jenny',
        last_name: '',
        google_id: '4321',
        google_token: '454E5a7s12'
      })
      headers = { "CONTENT_TYPE" => "application/json" }

      post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)

      expect(response).to_not be_successful
      expect(response.body).to include("Last name can\'t be blank")
    end
  end

  describe '#Show' do
    it 'can find a user by email and authenticate using token' do
      user_params = ({
        email: 'jimmyjoe@gmail.com',
        first_name: 'Jimmy',
        last_name: 'Joe',
        google_id: '1234',
        google_token: '474E5a5s12'
      })
      headers = { "CONTENT_TYPE" => "application/json" }

      post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)

      headers = {
        "CONTENT_TYPE" => "application/json",
        "HTTP_AUTH_TOKEN" => user_params[:google_token],
        "HTTP_AUTH_VAL" => user_params[:email] 
      }

      get api_v1_user_path(user_params[:google_id]), headers: headers

      expect(response).to be_successful

      created_user = JSON.parse(response.body, symbolize_names: true)[:data].first

      expect(created_user[:attributes][:email]).to eq(user_params[:email])
      expect(created_user[:attributes][:first_name]).to eq(user_params[:first_name])
      expect(created_user[:attributes][:last_name]).to eq(user_params[:last_name])
      expect(created_user[:attributes][:google_id]).to eq(user_params[:google_id])
      expect(created_user[:attributes][:google_token]).to eq(user_params[:google_token])
    end

    it 'notifies of errors due to missing attributes' do
      user_params = ({
        email: 'jimmyjoe@gmail.com',
        first_name: 'Jimmy',
        last_name: 'Joe',
        google_id: '1234',
        google_token: '474E5a5s12'
      })
      headers = { "CONTENT_TYPE" => "application/json" }

      post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)

      get api_v1_user_path(user_params[:google_id]), headers: headers

      expect(response).to_not be_successful
    end
  end
end
