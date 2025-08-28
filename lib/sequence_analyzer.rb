module SequenceAnalyzer
  def self.find_missing_number(arr, nth: 1)
    raise ArgumentError, 'Array must contain unique integers' unless arr.uniq.size == arr.size
    raise ArgumentError, 'nth must be an integer' unless nth.is_a?(Integer)
    raise ArgumentError, 'nth must be greater than 0' unless nth > 0

    return 1 if arr.empty?

    current_number = 1
    missing_number_count = 0

    while missing_number_count < nth
      if !arr.include?(current_number)
        missing_number_count += 1
      end

      return current_number if  missing_number_count == nth
      
      current_number += 1 if missing_number_count < nth
    end

    return current_number
  end
end