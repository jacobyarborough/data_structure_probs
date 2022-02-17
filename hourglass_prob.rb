
require 'json'
require 'stringio'

# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.

def hourglassSum(arr)
    rn = 0
    sum_array = []
    
    (0..3).each do |i|
        (0..3).each do |i|
            sum_array.push(arr[rn][i] + arr[rn][i+1] + arr[rn][i+2] + arr[rn+1][i+1] + arr[rn+2][i] + arr[rn+2][i+1] + arr[rn+2][i+2])
        end 
        rn += 1
    end
    sum_array.max
end

fptr = File.open('file_goes_here', 'w')

arr = Array.new(6)

6.times do |i|
    arr[i] = gets.rstrip.split.map(&:to_i)
end

result = hourglassSum arr

fptr.write result
fptr.write "\n"

fptr.close()
