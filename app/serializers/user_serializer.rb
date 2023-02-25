class UserSerializer
  def self.format_user(user)
    {
      "data":
        [{
          "id":   user.id,
          "type": user.class.to_s.downcase,
          "attributes": {
            "first_name":   user.first_name,
            "last_name":    user.last_name,
            "email":        user.email,
            "google_id":    user.google_id,
            "google_token": user.google_token
          }
        }]
    }
  end
end
