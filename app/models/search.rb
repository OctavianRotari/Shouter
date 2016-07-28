class Search
  include ActiveModel::Conversion

  attr_reader :term

  def initialize options = {}
    @term = options.fetch(:term, "")
  end

  def shouts
    if term.include? "#"
      search_text_with_hashtag
    else
      search_through_all
    end
  end

  private

  def search_term
    "%#{term}%"
  end

  def text_shouts
    TextShout.where("body LIKE ?", search_term )
  end

  def search_text_with_hashtag
    Shout.text_shouts.where(content_id: text_shouts)
  end

  def search_through_all
    Shout.search do
      fulltext term
    end
  end
end
