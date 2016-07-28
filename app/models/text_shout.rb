class TextShout < ApplicationRecord
  validates :body, presence: true

  def index
    body
  end

end
