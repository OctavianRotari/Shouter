class Search
  include ActiveModel::Conversion

  attr_reader :term

  def initialize options = {}
    @term = options.fetch(:term, "")
  end

  def shouts
    Shout.search do
      fulltext term
    end.results
  end
end
