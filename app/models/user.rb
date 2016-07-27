class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :shouts

  has_many :followed_user_relationships, foreign_key: :follower_id, class_name: :'FollowingRelationship'
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships, foreign_key: :followed_user_id, class_name: :'FollowingRelationship'
  has_many :followers, through: :following_relationships

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def following? user
    followed_user_ids.include? user.id
  end

  def follow user
    followed_users << user
  end

  def unfollow user
    followed_users.delete(user)
  end

end
