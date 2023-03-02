class UserAccomplishmentsSerializer 
  def self.accomplishments(collection)
    { "data": { 
        "user": {
          "user_id": collection[:user][:user_id],
          "user_first_name": collection[:user][:first_name],
          "user_last_name": collection[:user][:last_name],
          "breweries": collection[:user][:breweries],
          "trails": collection[:user][:trails]
        }
      }
    }
  end
end