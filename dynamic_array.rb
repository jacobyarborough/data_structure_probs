#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'dynamicArray' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER n
#  2. 2D_INTEGER_ARRAY queries
#

def dynamicArray(n, queries)
    arr = Array.new(n)
    
    (0..arr.length).each do |i|
        arr[i] = []
    end 
    
    answers = []
    la = 0
    
    queries.each do |a|
        if a.length > 2 
            if a[0] == 1
                arr[(a[1] ^ la) % n].push(a[2])
            elsif a[0] == 2
                idx = ((a[1] ^ la) % n)
                la = arr[idx][(a[2] % arr[idx].length)]
                answers.push(la)
            end 
        end 
    end 
    
    answers
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

q = first_multiple_input[1].to_i

queries = Array.new(q)

q.times do |i|
    queries[i] = gets.rstrip.split.map(&:to_i)
end

result = dynamicArray n, queries

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
