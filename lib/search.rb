require_relative 'search_engine'

class Search

  attr_reader :queries

  def initialize
    @search_engine = SearchEngine.new
    @queries, @results = [], []
  end

  def pages
    @search_engine.pages
  end

  def from_file(file_path)
    read_file(file_path)
  end

  def perform
    @results = @queries.map do |query|
      @search_engine.search(*query)
    end
  end

  def to_s
    @results.each_with_index.map do |results, index|
      ["Q#{index + 1}:", *results] * ' '
    end.join("\n")
  end

  private

    def read_file(file_path)
      IO.foreach(file_path) do |line|
        handle_input(line.split(" "))
      end
    end

    def handle_input(line)
      case line.shift
      when 'P'
        @search_engine.add_page(Page.new(line))
      when 'Q'
        @queries << line
      end
    end
end
