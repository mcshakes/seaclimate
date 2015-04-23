class User < ActiveRecord::Base

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.id)
    # binding.pry
    # user.email = data.info.email # DOn't have
    user.nickname    = data.info.nickname
    user.name        = data.info.name
    user.image       = data.info.image
    user.token       = data.credentials.token
    user.save

    user
  end


end