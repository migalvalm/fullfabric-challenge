module SequenceAnalyzer
  def self.find_missing_number(arr, nth: 1)    
    return 1 if arr.empty?
    
    sorted_arr = arr.sort
    current_number = 1
    missing_count = 0
    
    while missing_count < nth
      if !sorted_arr.include?(current_number)
        missing_count += 1
        return current_number if missing_count == nth
      end
      current_number += 1
    end
  end
end