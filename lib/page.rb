require_relative 'keywords'
require_relative 'page_number'

class Page
  include Keywords

  attr_reader :page_number

  def initialize(keywords)
    @keywords = normalize_keywords(keywords)
    @page_number = PageNumber.instance.next
  end

  def to_s
    "P#{@page_number}"
  end
end
