class JsonWebToken
 class << self
   def encode(payload)
     JWT.encode(payload, Rails.application.secrets.secret_key_base)
   end

   def decode(token)
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base).first
    HashWithIndifferentAccess.new(decoded_token)
    rescue
    nil # JWT throws error for null tokens
   end
 end
end