#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'rotateLeft' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER d
#  2. INTEGER_ARRAY arr
#

def rotateLeft(d, arr)
    x = arr.shift(d)
    arr.push(x)
    arr.flatten
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

d = first_multiple_input[1].to_i

arr = gets.rstrip.split.map(&:to_i)

result = rotateLeft d, arr

fptr.write result.join " "
fptr.write "\n"

fptr.close()
