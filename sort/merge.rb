def merge_sort(arr)
  return arr if arr.length == 1
  mid = arr.length / 2
  left, right = arr[0..mid-1], arr[mid..-1]
  merge_arr(merge_sort(left), merge_sort(right))
end

def merge_arr(arr1, arr2)
  sorted = []
  i, j = 0, 0
  while i < arr1.length && j < arr2.length
    if arr1[i] < arr2[j]
      sorted.push(arr1[i])
      i += 1
    else
      sorted.push(arr2[j])
      j += 1
    end
  end
  sorted += i < arr1.length ? arr1[i..-1] : arr2[j..-1]
  sorted
end
