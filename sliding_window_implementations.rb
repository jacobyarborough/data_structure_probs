# sliding window with k fixed length 
# example find the maximum sum of a continguous subarray of length 3
class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

def max_sum(array, k)
  i = 0
  current_sum = 0 
  maximum = Integer::MIN

  while (i < array.length) do 
    current_sum += array[i]

    if i >= (k-1)
      maximum = [maximum, current_sum].max
      current_sum -= array[i - (k-1)]
    end

    i += 1
  end 
  puts maximum
end 

# sliding window with variable length 
# example find the smallest subarray where the sum is greater or equal to eight 
def find_length(array, target_sum)
  i = 0
  j = 0
  current_sum = 0
  len = Integer::MAX

  while (j < array.length) do 
    current_sum += array[j]

    while (current_sum >= target_sum) do 
      len = [len, (j - i + 1)].min
      current_sum -= array[i]
      i += 1
    end 

    j += 1
  end 
  puts len
end 


# sliding window with an auxillary data structure 
# example largest substring with k distinct characters 
def find_uniq(array, k)
  char_dict = {array[0] => 1}
  i = 0
  j = 0
  len = Integer::MIN
  current_len = 0

  while (j < array.length) do 
    while (char_dict.length <= k) do 
      len = [len, (j - i + 1)].max
      j += 1
      if char_dict[array[j]]
        char_dict[array[j]] += 1
      else 
        char_dict[array[j]] = 1
      end 
    end 

    if char_dict[array[i]] == 1
      array.delete(array[i])
    else 
      char_dict[array[i]] -= 1
    end 

    i += 1
  end 
  puts len
end 