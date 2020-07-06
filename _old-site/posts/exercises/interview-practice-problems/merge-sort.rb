def mergeSort(arr)
    return arr if arr.length < 2

    newArr = []
    mid = arr.length / 2

    arr1 = mergeSort(arr[0...mid])
    arr2 = mergeSort(arr[mid..-1])

    until  arr1.empty? && arr2.empty?
        if arr1.empty?
            newArr << arr2.shift
        elsif arr2.empty?
            newArr << arr1.shift
        else
            newArr << (arr1.first < arr2.first ? arr1.shift : arr2.shift)
        end
    end

    return newArr
end

def mergeSortV2(arr)
    return arr if arr.length < 2

    newArr = []
    mid = arr.length / 2

    merge mergeSortV2(arr[0...mid]), mergeSortV2(arr[mid..-1])
end

def merge(arr1, arr2)
    newArr = []

    until  arr1.empty? || arr2.empty?
        newArr << (arr1.first < arr2.first ? arr1.shift : arr2.shift)
    end

    newArr + arr1 + arr2
end

def mergeProc(arr, proc=Proc.new{|x,y| x < y})
    return arr if arr.length == 1
    mid = arr.length / 2

    arr1 = arr[0...mid]
    arr2 = arr[mid..-1]

    mergeV2(mergeProc(arr1, proc), mergeProc(arr2,proc), proc)
end

def mergeV2(arr1, arr2, proc=Proc.new{|x,y| x < y })
    merged = []
    until arr1.empty? || arr2.empty?
        proc.call(arr1.first, arr2.first) ? merged << arr1.shift : merged << arr2.shift
    end
    merged + arr1 + arr2
end

if __FILE__ == $PROGRAM_NAME
    # arr1 = [1,3,7,4,0,5,8,8,2]
    # puts "\narr1 = #{arr1}"
    # puts "mergeSort(arr1) = #{mergeSort(arr1)}"
    # puts "solved: #{mergeSort(arr1) == [0,1,2,3,4,5,7,8,8]}\n"

    # arr2 = [0,9,0,0,0,1,5,2,2,3]
    # puts "\narr2 = #{arr2}"
    # puts "mergeSort(arr2) = #{mergeSort(arr2)}"
    # puts "solved: #{mergeSort(arr2) == [0,0,0,0,1,2,2,3,5,9]}\n"

    # arr1 = [1,3,7,4,0,5,8,8,2]
    # puts "\narr1 = #{arr1}"
    # puts "mergeSortV2(arr1) = #{mergeSortV2(arr1)}"
    # puts "solved: #{mergeSortV2(arr1) == [0,1,2,3,4,5,7,8,8]}\n"

    # arr2 = [0,9,0,0,0,1,5,2,2,3]
    # puts "\narr2 = #{arr2}"
    # puts "mergeSortV2(arr2) = #{mergeSortV2(arr2)}"
    # puts "solved: #{mergeSortV2(arr2) == [0,0,0,0,1,2,2,3,5,9]}\n"

    arr1 = [1,3,7,4,0,5,8,8,2]
    proc1 = Proc.new{|x,y| x < y}
    puts "\narr1 = #{arr1}"
    puts "mergeProc(arr1, proc1) = #{mergeProc(arr1, proc1)}"
    puts "solved: #{mergeProc(arr1, proc1) == [0,1,2,3,4,5,7,8,8]}\n"

    arr2 = [0,9,0,0,0,1,5,2,2,3]
    proc2 = Proc.new{|x,y| x > y}
    puts "\narr2 = #{arr2}"
    puts "mergeProc(arr2, proc2) = #{mergeProc(arr2, proc2)}"
    puts "solved: #{mergeProc(arr2, proc2) == [9,5,3,2,2,1,0,0,0,0]}\n"

    puts ""
end