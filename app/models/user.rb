class User < ActiveRecord::Base
  has_many :trips

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.id)
    user.nickname    = data.info.nickname
    user.name        = data.info.name
    user.image       = data.info.image
    user.token       = data.credentials.token
    user.save
    user
  end
end
