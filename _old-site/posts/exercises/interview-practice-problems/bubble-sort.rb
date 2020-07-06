require 'byebug'

def bubbleSort(arr)
    #iterates through the array, inspecting two adjacent elements and swapping in ascending order
    return arr if arr.count < 2

    (arr.length - 1).times do |i|
        x,  y = arr[i], arr[i+1]
        if x > y
            arr[i+1], arr[i] = x, y
        end
    end
    
    bubbleSort(arr[0...-1]) + [arr[-1]]
end


def bubbleSortProc(arr, proc=Proc.new {|x, y| x > y }) #add optional proc arg
    #iterates through the array, inspecting two adjacent elements and swapping place based on the sorting algorithm
    return arr if arr.count < 2

    (arr.length - 1).times do |i|
        x,  y = arr[i], arr[i+1]
        if proc.call(x, y)
            arr[i+1], arr[i] = x, y
        end
    end
    
    bubbleSortProc(arr[0...-1], proc) + [arr[-1]]
end

if __FILE__ == $PROGRAM_NAME
    # test1
    puts "\n\nbubbleSort([1,4,2,3]) == #{bubbleSort([1,4,2,3])}"
    puts "FALSE: should equal [1,2,3,4]" unless (bubbleSort([1,4,2,3]) == [1,2,3,4])
 
    # test2
    puts "\n\nbubbleSort([8,2,6,0,1,4,6]) == #{bubbleSort([8,2,6,0,1,4,6])}"
    puts "FALSE: should equal [0,1,2,4,6,6,8]" unless (bubbleSort([0,1,2,4,6,6,8]) == [0,1,2,4,6,6,8])

    # test3
    puts "\n\nbubbleSortProc([1,4,2,3], Proc.new{|x,y| x > y }) == #{bubbleSortProc([1,4,2,3])}"
    puts "FALSE: should equal [1,2,3,4]" unless (bubbleSortProc([1,4,2,3]) == [1,2,3,4])

    # test4
    puts "\n\nbubbleSortProc([8,2,6,0,1,4,6], Proc.new{|x,y| x > y }) == #{bubbleSortProc([8,2,6,0,1,4,6])}"
    puts "FALSE: should equal [0,1,2,4,6,6,8]" unless (bubbleSortProc([0,1,2,4,6,6,8]) == [0,1,2,4,6,6,8])

    # test5
    puts "\n\nbubbleSortProc([1,4,2,3], Proc.new{|x,y| x < y }) == #{bubbleSortProc([1,4,2,3], Proc.new{|x,y| x < y })}"
    puts "FALSE: should equal [4,3,2,1]" unless (bubbleSortProc([1,4,2,3], Proc.new{|x,y| x < y }) == [4,3,2,1])

    # test6
    puts "\n\nbubbleSortProc([8,2,6,0,1,4,6], Proc.new{|x,y| x < y }) == #{bubbleSortProc([8,2,6,0,1,4,6], Proc.new{|x,y| x < y })}"
    puts "FALSE: should equal [8,6,6,4,2,1,0]" unless (bubbleSortProc([8,2,6,0,1,4,6], Proc.new{|x,y| x < y }) == [8,6,6,4,2,1,0])
end