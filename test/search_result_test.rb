require 'minitest/autorun'
require 'search_result'

class SearchResultTest < MiniTest::Unit::TestCase

  def setup
    PageNumber.instance.reset

    @page = Page.new(%w(toyota car))
    @other_page = Page.new(%w(mercedes car))
  end

  def test_sorting_by_score
    result = SearchResult.new(@page, 1)
    other_result = SearchResult.new(@other_page, 2)

    assert_equal [other_result, result], [result, other_result].sort
  end

  def test_sorting_by_score_other
    result = SearchResult.new(@page, 2)
    other_result = SearchResult.new(@other_page, 1)

    assert_equal [result, other_result], [other_result, result].sort
  end

  def test_sorting_with_equal_score
    result = SearchResult.new(@page, 2)
    other_result = SearchResult.new(@other_page, 2)

    assert_equal [result, other_result], [other_result, result].sort
    assert_equal [result, other_result], [result, other_result].sort
  end
end
