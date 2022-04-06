# find the sqrt of a given integer using binary search

def find_sqrt(num)
  return 0 if num == 0
  return 1 if num == 1

  start_index = 0
  end_index = num
  ans = nil

  while start_index <= end_index 
    mid = (start_index + end_index)

    return mid if (mid * mid) == num

    if (mid * mid) < num 
      start_index = mid + 1
      ans = mid 
    else 
      end_index = mid - 1
    end
    
    return ans
  end 
end 

puts find_sqrt(2)