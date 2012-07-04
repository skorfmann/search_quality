require_relative 'page'
require_relative 'search_result'
require 'active_support/all'

class SearchEngine
  include Keywords

  attr_reader :pages

  def initialize(max_keywords = 8, max_search_results = 5)
    @max_keywords = max_keywords
    @max_search_results = max_search_results - 1
    @pages = []
  end

  def add_page(page)
    @pages << page
  end

  def search(*keywords)
    keywords = normalize_keywords(keywords)

    pages.map do |page|
      if (score = match(page.keywords, keywords)) > 0
        SearchResult.new(page, score)
      end
    end.compact.sort[0..@max_search_results]
  end

  def match(keywords_page, keywords_query)
    (keywords_page & keywords_query).sum do |keyword|
      score(keywords_query, keyword) * score(keywords_page, keyword)
    end
  end

  private

    def score(keywords, keyword)
      keywords.index(keyword) - @max_keywords
    end
end
