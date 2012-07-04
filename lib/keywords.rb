module Keywords

  attr_reader :keywords

  def normalize_keywords(keywords)
    keywords.map(&:downcase)
  end
end
