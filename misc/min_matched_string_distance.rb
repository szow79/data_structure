string = "the big a grey a poop dog eat a a a a a big poop a with big poop dog the other a big a orange a fancy poop dog"

class Word
  attr_accessor :value, :index
  def initialize(value, index)
    @value = value
    @index = index
  end
end

def s(string)
  dict = {"big" => true, "poop" => true, "dog" => true}
  current_word = nil
  arr = string.split(" ")
  min_index = nil
  max_index = nil
  min_diff = nil
  queue = []
  arr.each_with_index do |word, index|
    if queue.size < 3
      if dict[word]
        queue.push(Word.new(word, index))
        dict[word] = nil
      end
    else
      current_word = queue[0].value
      if current_word == word
        removed_word = queue.shift
        diff = index - removed_word.index
        p diff
        if min_index.nil? || min_diff > diff
          min_index = removed_word.index
          max_index = index - 1
          min_diff = diff
        end
        queue.push(Word.new(word, index))
      end
    end
  end
  return min_diff, min_index, max_index
end
