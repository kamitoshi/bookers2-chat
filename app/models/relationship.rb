class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  # フォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # フォローを外す
  def unfollow(user_id)
    follower.find_by(folloewed_id: user_id).destroy
  end

  # フォローしているかの確認
  def following?(user)
    following_user.include?(user)
  end

end
