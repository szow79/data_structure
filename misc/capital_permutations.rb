# capitalPermutations(word) -
# Given a string of letters,
# return all the possible combinations of lower and uppercase
# letters of that word.

# cat : Cat, cAt, caT, CAt, cAT, CAT, cat,
# ca :
# c

def capital_permutations(str)
  output = []
  str.chars.each_with_index do |char, index|
    if index == 0
      output << char
      output << char.upcase
    else
      new_output = []
      output.each do |string|
        new_output << string + char
        new_output << string + char.upcase
      end
      output = new_output
    end
  end
  output
end

str = "cat"
puts capital_permutations(str)
