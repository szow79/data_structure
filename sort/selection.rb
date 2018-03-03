def selection_sort(arr)
  i = 0
  while i < arr.length
    j = i
    current_min = {index: nil, value: nil}
    while j < arr.length
      if current_min[:value].nil? || current_min[:value] > arr[j]
        current_min = {index: j, value: arr[j]}
      end
      j += 1
    end
    arr[i], arr[current_min[:index]] = arr[current_min[:index]], arr[i]
    i += 1
  end
  arr
end
