require 'pry'
def min_window(s, t)
  child_dict = {}

  t.split("").each do |char|
    if child_dict[char]
      child_dict[char] += 1
    else 
      child_dict[char] = 1
    end 
  end 

  uniq_chars = child_dict.size
  current_dict = {}
  i = 0
  j = 0
  current_window = []
  minimum_window = []
  counter = 0
  conditions = 0

  while (j < s.length) do 
    current_window.push(s[j])

    if current_dict[s[j]]
      current_dict[s[j]] += 1
    else 
      current_dict[s[j]] = 1
    end 

    child_dict.each do |key, val|
      if current_dict[key] 
        if current_dict[key] >= val 
          conditions += 1
        end
      end
    end 

    while (conditions >= uniq_chars) do 
      if counter == 0
        minimum_window = current_window
      elsif minimum_window.length >= current_window.length
        minimum_window = current_window
      end 
      binding.pry
      current_window.delete_at(0)
      binding.pry

      if current_dict[s[i]] == 1
        current_dict.delete(s[i])
      else 
        current_dict[s[i]] -= 1
      end 
      
      conditions = 0
      i += 1
      counter += 1

      child_dict.each do |key, val|
        if current_dict[key] 
          if current_dict[key] >= val 
            conditions += 1
          end
        end
      end 
    end  
    conditions = 0

    j += 1
  end 
  puts minimum_window
end 

parent_string = "ADOBECODEBANC"
child_string = "ABC"

min_window(parent_string, child_string)