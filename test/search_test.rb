require 'minitest/autorun'
require 'search'

class SearchTest < MiniTest::Unit::TestCase

  def setup
    PageNumber.instance.reset
    @search = Search.new
    @search.from_file(File.join(File.expand_path(File.dirname(__FILE__)), 'fixtures/example'))
  end

  def test_search_output
    @search.perform
    expected_output = <<-EXAMPLE
Q1: P1 P3
Q2: P6 P1 P2 P4 P5
Q3: P2 P3 P1
Q4: P3 P1 P2
Q5: P1 P3 P6 P2 P4
Q6:
EXAMPLE
    assert_equal expected_output.chomp, @search.to_s
  end
end
