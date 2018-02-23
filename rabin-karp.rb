def rabin_karp(obj)
  str = obj.to_s
  a = 101
  n = 2 ** 32
  k = str.length
  running_a = a ** k
  result = 0
  str.chars.each do |c|
    running_a /= a
    cc = c.ord
    result += cc * running_a
    result = result % n
  end
  result
end
