class User < ApplicationRecord
  def self.find_or_create(auth, token)
    user = User.find_or_create_by(uid: auth[:user][:encodedId])
    user.age = auth[:user][:age]
    user.first_name = auth[:user][:firstName]
    user.display_name = auth[:user][:displayName]
    user.birthdate = auth[:user][:dateOfBirth]
    user.token = token
    user.save!
    user
  end
end
