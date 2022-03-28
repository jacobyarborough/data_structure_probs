def binary_search(sorted_array, search_value)
  start_index = 0
  end_index = sorted_array.length - 1

  while start_index <= end_index
    mid = (start_index + end_index)/2

    return mid if sorted_array[mid] == search_value

    if search_value < sorted_array[mid]
      end_index = mid - 1
    else 
      start_index = mid + 1
    end 
  end 

  return false
end 


array1 = [1,4,8,13,42,56,78,93]
val = 93

puts binary_search(array1, val)