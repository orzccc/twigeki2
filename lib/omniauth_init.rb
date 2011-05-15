module OmniauthInitializer
  def self.registered(app)
    app.use OmniAuth::Builder do
      provider :twitter, TWGKCONF[:twitter]["token"], TWGKCONF[:twitter]["secret"]
      #provider :facebook, 'app_id', 'app_secret'
      # provider :campfire
      # provider :basecamp
    end

  end
end
