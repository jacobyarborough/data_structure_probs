require 'pry'
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


# binary search recursively

def binary_search_recursive(sorted_array, search_value, start_index, end_index)
  return false if start_index > end_index

  mid = (start_index + end_index)/2

  return mid if sorted_array[mid] == search_value

  if search_value < sorted_array[mid]
    binary_search_recursive(sorted_array, search_value, start_index, mid - 1)
  else 
    binary_search_recursive(sorted_array, search_value, mid + 1, end_index)
  end 
end 

array2 = [1,4,8,13,42,56,78,93]
search_val = 93

puts binary_search_recursive(array2, search_val, 0, array2.length - 1)