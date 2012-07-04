require 'minitest/autorun'
require 'page'

class PageTest < MiniTest::Unit::TestCase

  def setup
    PageNumber.instance.reset
  end

  def test_initialize_with_keywords
    keywords =  %w(car toyota)
    page = Page.new(keywords)
    assert_equal keywords, page.keywords
  end

  def test_normalize_keywords
    keywords =  %w(CaR toYota)
    page = Page.new(keywords)
    assert_equal keywords.map(&:downcase), page.keywords
  end

  def test_page_have_page_number
    first_page = Page.new(%w(car))
    second_page = Page.new(%w(car hi))

    assert_equal 1, first_page.page_number
    assert_equal 2, second_page.page_number
  end
end
