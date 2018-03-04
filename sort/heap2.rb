def heap_sort(arr)
  heapify(arr)
  i = arr.length - 1
  while i >= 0
    arr[0], arr[i] = arr[i], arr[0]
    sift_down(arr, 0, i)
    i -= 1
  end
  arr
end

def heapify(arr)
  i = arr.length / 2
  while i >= 0
    sift_down(arr, i)
    i -= 1
  end
end

def sift_down(arr, i, length=nil)
  length = length ||= arr.length - 1
  left = i * 2 + 1
  right = i * 2 + 2
  max = i
  if left < length && arr[left] > arr[max]
    max = left
  end
  if right < length && arr[right] > arr[max]
    max = right
  end
  if max != i
    arr[max], arr[i] = arr[i], arr[max]
    sift_down(arr, max, length)
  end
end

# max heap
