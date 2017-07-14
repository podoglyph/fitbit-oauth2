class User < ApplicationRecord
  def self.find_or_create_by_omniauth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])
    user.save!
    user
  end
end
