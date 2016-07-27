require "digest/md5"

module ShoutsHelper
  def gravatar user, size = 48
    if user.image?
      image_tag(user.image, size: size)
    else
      digest = Digest::MD5.hexdigest(user.email)
      image_tag("http://gravatar.com/avatar/#{digest}?s=#{size}")
    end
  end
end
