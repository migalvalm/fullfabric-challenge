require 'spec_helper'

RSpec.describe SequenceAnalyzer do
  describe '.find_missing_number' do
    context 'when array is empty' do
      it do 
        expect(SequenceAnalyzer.find_missing_number([])).to eq(1)
      end
    end

    context 'when array contains duplicates' do
      it do
        array_with_duplicates = [1, 2, 2, 4] 
        expect { SequenceAnalyzer.find_missing_number(array_with_duplicates) }
          .to raise_error(ArgumentError, 'Array must contain unique integers')
      end
    end

    context 'when nth is not an integer' do
      it do 
        array = [1, 2, 3] 
        expect { SequenceAnalyzer.find_missing_number(array, nth: '1') }
          .to raise_error(ArgumentError, 'nth must be an integer')
      end
    end

    context 'when nth is less than 1' do
      it do 
        array = [1, 2, 3] 

        expect { SequenceAnalyzer.find_missing_number(array, nth: 0) }
          .to raise_error(ArgumentError, 'nth must be greater than 0') 
      end
    end

    context 'when array contains unique integers' do
      it do 
        array = [4, 3, 6, 2, 1, 7]
        expect(SequenceAnalyzer.find_missing_number(array)).to eq(5)
      end
      it do
        array = [4, 3, 6, 2, 1, 7]
        expect(SequenceAnalyzer.find_missing_number(array, nth: 2)).to eq(8)
      end
      it do
        array = [4, 3, 6, 2, 1, 7]
        expect(SequenceAnalyzer.find_missing_number(array, nth: 3)).to eq(10)
      end
    end
  end
end