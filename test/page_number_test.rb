require 'minitest/autorun'
require 'page_number'

class PageNumberTest < MiniTest::Unit::TestCase

  def setup
    PageNumber.instance.reset
  end

  def test_next_page_number
    assert_equal 1, PageNumber.instance.next
    assert_equal 2, PageNumber.instance.next
  end

  def test_reset_page_nubmer
    assert_equal 1, PageNumber.instance.next
    assert_equal 2, PageNumber.instance.next

    PageNumber.instance.reset

    assert_equal 1, PageNumber.instance.next
  end
end
