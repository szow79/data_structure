require "set"

string = "cat"

def permutation(string)
  return Set.new([string]) if string.length == 1
  # "t"
  last_char = string[-1]
  # "ca"
  other_chars = string[0..-2]

  permutations = Set.new

  # "ca", "ac"
  results = permutation(other_chars)
  results.each do |permutation_string|
    (0..permutation_string.length).each do |index|
      permutations << permutation_string.dup.insert(index, last_char)
    end
  end
  permutations
end
