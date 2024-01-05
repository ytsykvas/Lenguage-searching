# frozen_string_literal: true

class SearchService
  def initialize(data)
    # Initialize the SearchService with the provided data.
    @data = data
  end

  def search(query)
    # Return the entire dataset if the query is blank.
    return @data if query.blank?

    # Extract positive and negative terms from the query.
    positive_terms, negative_terms = parse_query(query)
    results = []

    # Iterate through each entry in the dataset.
    @data.each do |entry|
      # Calculate the relevance of the entry based on the query terms.
      relevance = calculate_relevance(entry, positive_terms, negative_terms)
      # Include the entry in the results if its relevance is positive.
      results << { entry:, relevance: } if relevance.positive?
    end

    # Sort the results by relevance in descending order and return only the entries.
    results.sort_by { |result| -result[:relevance] }.map { |item| item[:entry] }
  end

  private

  def calculate_relevance(entry, positive_terms, negative_terms)
    relevance = 0

    # Calculate relevance for positive terms in different fields of the entry.
    positive_terms.each do |term|
      if entry['Name'].to_s.downcase.include?(term)
        relevance += 5
      elsif entry['Type'].to_s.downcase.include?(term)
        relevance += 3
      elsif entry['Designed by'].to_s.downcase.include?(term)
        relevance += 2
      else
        relevance = 0
        break
      end
    end

    # Check for negative matches in any field of the entry.
    negative_match = negative_terms.any? do |term|
      entry['Name'].to_s.downcase.include?(term) || entry['Type'].to_s.downcase.include?(term) ||
        entry['Designed by'].to_s.downcase.include?(term)
    end

    # Check for negative matches in any field of the entry.
    return -1 if negative_match

    # Return the calculated relevance for the entry.
    relevance
  end

  def parse_query(query)
    # Split the query into terms, separating positive and negative terms.
    terms = query.downcase.split(/\s+/)
    positive_terms = terms.reject { |term| term[0] == '-' }
    negative_terms = terms.select { |term| term[0] == '-' }.map { |term| term[1..] }

    # Return arrays of positive and negative terms.
    [positive_terms, negative_terms]
  end
end
