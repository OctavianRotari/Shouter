class Timeline
  include ActiveModel::Conversion

  def initialize user
    @user = user
  end

  def shouts
    Shout.where(user_id: shout_user_ids)
  end

  private

  def shout_user_ids
    @user.followed_user_ids + [@user.id]
  end

end
