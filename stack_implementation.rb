# stack data structure example problems

# example recreating the flatten method using a stack

def make_flat(arr)
  flat = []
  until arr.empty? 
    thing = arr.pop 

    if thing.is_a? Array
      thing.each do |i|
        arr.push(i)
      end 
    else 
      flat.push(thing)
    end 
  end 
  p flat
end 

# deep_array = [[1,2,3],4,5,[6,7,[8]]]

# make_flat(deep_array)

# example solve the balanced parenthesis problem

def valid_parens(str)
  arr = []
  paren_dict = {
  '(' => ')',
  '{' => '}',
  '[' => ']',
  '<' => '>'
}

  str.split("").each do |char|
    if paren_dict[char]
      arr.push(char)
    elsif paren_dict.value? char
      ele = arr.pop 
      return false if paren_dict[ele] != char 
    end 
  end 
  return false if arr.length > 0
  return true
end 

input = "1 + (4 + 6) () * 2"

puts valid_parens(input)