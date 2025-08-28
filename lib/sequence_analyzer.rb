module SequenceAnalyzer
  def self.find_missing_number(arr, nth: 1)
    raise ArgumentError, 'Array must contain unique integers' unless arr.uniq.size == arr.size
    raise ArgumentError, 'nth must be an integer' unless nth.integer?

    return 1 if arr.empty?

    current_number = 1
    missing_number_count = 0

    while missing_number_count < nth
      missing_number_count += 1 if !arr.include?(current_number)
      current_number += 1
    end

    return current_number
  end
end