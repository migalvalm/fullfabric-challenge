# Full Fabric Challenge - Find nth Missing Number

## Sequence Analyzer

A ruby module created to find the nth missing number in an unsorted array of unique integers

## Usage

The module provides a single method that will find the nth missing number in a sequence.

```ruby
SequenceAnalyzer.find_missing_number([4, 3, 6, 2, 1, 7], nth: 1)
> 5
```

## Solution approach

The first working solution I came up was a `sorted array approach`, which provided a lookup time of `O(log n)` but it required a `O(n log n)` sorting overhead which made it very bad for effiency.

Then by having the thought `"Why do I need to sort the array if I just wanna check if the number is within the array and the position of it does not matter to me?"` I came up with the solution of an `unsorted array approach`, this solution provided a lookup time of `O(n)` and would avoid completetly the sorting overhead we had in the other solution, making this implementation more efficient

Then I wanted to make the lookup time be even less, and remembered about the [.to_set](https://apidock.com/ruby/v2_6_3/Enumerable/to_set) method, this method converts the array to a `Set` once, providing constant-time lookups, this data structure is optimized for storing unique values (which is great for the challenge in question), making it way more memory efficient compared to using an `Array` or an `Hash`, this would then make the lookup time `O(1)` with the trade-off of bigger additional memory for the set strucutre and slightly bigger initalization overhead but in my opinion the most clear and optimized implementation we could have, unless...

### The use case where array would continue to infinity

_P.S This one I did not implement for lack of time but thought of the use case and this would be my way of doing things:_

I would change the search block to use binary search, which you can achieve by using the [.bsearch_index](https://apidock.com/ruby/v2_6_3/Array/bsearch_index) method, this method would need the array to be sorted so we would need to revert to sorting the array which would make us go back to the sorting overhead issue we found on the first solution I mentioned previously but it would be beneficial for very very large arrays since the cost of sorting would amortize the over many lookups. In this case lookup time would `O(n log n)`.

## Testing

Run tests with:

```bash
bundle install
rspec
```

The test suite covers all edge cases and performance scenarios asked in the challenge document.
