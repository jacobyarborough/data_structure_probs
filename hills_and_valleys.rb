def count_hill_valley(nums)
  i = 0
  j = 1
  k = 2
  count = 0
  
  while k < nums.length do 
      if nums[j] > nums[i] && nums[j] > nums[k] || nums[j] < nums[i] && nums[j] < nums[k]
          count += 1
          i += 1
          j += 1
          k += 1
      elsif nums[j] == nums[k] 
          while nums[j] == nums[k] && k < nums.length do 
              k += 1
              j += 1
          end 
          return count if k == nums.length
          if nums[j] > nums[i] && nums[j] > nums[k] || nums[j] < nums[i] && nums[j] < nums[k]
              count += 1
              k += 1
              j = k - 1
              i = k - 2
          else 
              k += 1
              j = k - 1
              i = k - 2
          end 
      else 
          i += 1
          j += 1
          k += 1
      end 
  end
  count 
end