# if the target is in the sorted array return the index of where it is stored in the array, else return the index where it should be inserted.

def search_insert(sorted_array, target)
  start_index = 0
  end_index = sorted_array.length - 1
  
  while start_index <= end_index
    mid = (start_index + end_index)/2
      
    return mid if sorted_array[mid] == target
      
    if target < sorted_array[mid]
        end_index = mid - 1
    else 
        start_index = mid + 1
    end 
  end 
  
  if target < sorted_array[mid] 
    if mid == 0
        0
    else 
      mid
    end 
  else 
    mid + 1
  end 
end