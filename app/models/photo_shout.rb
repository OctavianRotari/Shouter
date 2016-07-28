class PhotoShout < ApplicationRecord
  has_attached_file :image, styles: {
    shout: "200x200>"
  }
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def index
    image_file_name
  end
end
