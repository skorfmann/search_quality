require 'minitest/autorun'
require 'search_engine'

class SearchEngineTest < MiniTest::Unit::TestCase

  def setup
    @page = Page.new(%w(toyota car))
    @search_engine = SearchEngine.new(max_keywords = 8)
    @search_engine.add_page(@page)
  end

  def test_initialize_with_pages
    assert_equal [@page], @search_engine.pages
  end

  def test_score_first_matching
    score = @search_engine.match(@page.keywords, %w(toyota))
    assert_equal 64, score
  end

  def test_score_second_matching
    score = @search_engine.match(@page.keywords, %w(car))
    assert_equal 56, score
  end

  def test_score_nothing_matched
    score = @search_engine.match(@page.keywords, %w(mercedes))
    assert_equal 0, score
  end

  def test_score_all_matched
    score = @search_engine.match(@page.keywords, %w(toyota car))
    assert_equal 113, score
  end
end
