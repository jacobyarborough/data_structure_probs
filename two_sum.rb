# given an array of integers (nums) and an integer (target) return indicies of the two numbers such that they add up to the target
# each imput has one solution
require 'pry'

def find_sum(num_array, target)
  counter = 0
  num_hash = {}
  solution = []

  num_array.each do |num|
    if !num_hash[num]
      num_hash[num] = counter
    end 
    counter += 1
  end
  
  num_hash.each do |num, index|
    diff = target - num 
    if diff >= 0 
      if num_hash[diff] && num_hash[diff] != num_hash[num]
        solution.push(num_hash[diff])
        solution.push(num_hash[num])
        return solution
      end 
    end 
  end 
end 

binding.pry