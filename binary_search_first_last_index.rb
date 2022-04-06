# finding the first index where a target value occurs
def binary_search_first(sorted_array, target_value)
  start_index = 0
  end_index = sorted_array.length - 1
  result = false

  while start_index <= end_index 
    mid = (start_index + end_index)/2

    if target_value == sorted_array[mid]
      result = mid 
      end_index = mid - 1
    elsif target_value < sorted_array[mid]
      end_index = mid - 1
    else 
      start_index = mid + 1
    end 
  end 

  return result 
end 

array1 = [1,9,9,9,9,10,13,45,17,18,23,45]
val1 = 9

puts binary_search_first(array1, val1)

# finding the last index where a target value occurs
def binary_search_last(sorted_array, target_value)
  start_index = 0
  end_index = sorted_array.length - 1
  result = false

  while start_index <= end_index 
    mid = (start_index + end_index)/2

    if target_value == sorted_array[mid]
      result = mid 
      start_index = mid + 1
    elsif target_value < sorted_array[mid]
      end_index = mid - 1
    else 
      start_index = mid + 1
    end 
  end 

  return result 
end 

array2 = [1,9,9,9,9,10,13,45,17,18,23,45]
val2 = 9

puts binary_search_last(array1, val1)