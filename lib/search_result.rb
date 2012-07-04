class SearchResult

  attr_reader :page, :score

  def initialize(page, score = 0)
    @page, @score = page, score
  end

  def ==(other)
    @page == other.page
  end

  def to_s
    @page.to_s
  end

  def <=>(other)
    if other.score == @score
      page.page_number <=> other.page.page_number
    else
      other.score <=> @score
    end
  end
end
