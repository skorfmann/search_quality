require 'singleton'

class PageNumber
  include Singleton

  def initialize
    @count = 0
  end

  def next
    @count += 1
  end

  def reset
    @count = 0
  end
end
