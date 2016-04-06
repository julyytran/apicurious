class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(uid: auth["uid"]).first_or_create do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
      user.nickname = auth["info"]["nickname"]
      user.image = auth["extra"]["raw_info"]["avatar_url"]
    end
  end
end
