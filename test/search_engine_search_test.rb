require 'minitest/autorun'
require 'search_engine'

class SearchEngineSearchTest < MiniTest::Unit::TestCase

  def setup
    @page = Page.new(%w(toyota Car))
    @other_page = Page.new(%w(MerCedes auto))

    @search_engine = SearchEngine.new
    @search_engine.add_page @page
    @search_engine.add_page @other_page
  end

  def test_search_for_pages
    assert_equal [SearchResult.new(@page)], @search_engine.search('toyota')
  end

  def test_search_for_pages_case_insensitive
    assert_equal [SearchResult.new(@other_page)], @search_engine.search('Mercedes')
  end

  def test_returns_only_five_results
    7.times { @search_engine.add_page(Page.new(%w(toyota Car))) }
    assert_equal 5, @search_engine.search('toyota').length
  end
end
