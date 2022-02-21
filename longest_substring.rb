require 'pry'

# def lenth_of_longest_substrings(s)
#   answer_array = []
#   temp_array = []
#   count = 1

#   string_array = s.split("")
#   return 1 if string_array.length == 1
#   return string_array.length if string_array == string_array.uniq

#   string_array.each do |char|
#     temp_array = []
#     temp_array.push(char)
#     string_array[count..string_array.length].each do |i|
#       if temp_array.include?(i)
#         if answer_array.empty? || temp_array.length > answer_array.length
#           answer_array = temp_array 
#           temp_array = []
#         else 
#           temp_array = []
#         end 
#       else 
#         temp_array.push(i)
#       end 
#     end 

#     if answer_array.empty? || temp_array.length > answer_array.length
#       answer_array = temp_array 
#     end 

#     count += 1
#   end 
#   answer_array.length
# end 

def lenth_of_longest_substrings(s)
  char_array = s.split("")

  i = 0
  j = 0
  result = 0 
  current = {}

  for j in (0..(char_array.length - 1)) do 
    if current[char_array[j]]
      i = [current[char_array[j]], i].max
    end 
    result = [result, (j - i + 1)].max
    current[char_array[j]] = (j + 1)
  end 

  result
end 