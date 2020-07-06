def bucketSort(arr)
    #sort integers from 0-999 in ten buckets corresponding to the hundreds digit
    #an insert sort algorith then sorts each bucket
    #the buckets are then combined in order
    
    buckets = Array.new(10)
    arr.each {|el| buckets[el/100] << el} #the bucket index is determined by the algorithm el/100 i.e. 99 => bucket[0] 201 => bucket[2] 
    sorted_buckets = buckets.map {|bucket| insertSort(bucket)}

    sorted_buckets.flatten
end

def insertSort(arr)
    #iterates over the array, each element is shifted backwards if it is smaller then a previous element
    #continues until every element has been iterated

    (1...arr.length).each do |idx|
        if arr[idx] < arr[idx-1]
            arr[idx-1], arr[idx] = arr[idx], arr[idx-1]
            temp_idx = idx - 1
            while temp_idx >= 0
                if arr[temp_idx] < arr[temp_idx-1]
                    arr[temp_idx - 1], arr[temp_idx] = arr[temp_idx], arr[temp_idx - 1]
                end
            end
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    arr1 = [0, 20, 500, 752, 18, 29, 75, 2]
    sol1 = [0, 2, 18, 20, 29, 75, 500, 752]
    puts "bucketSort(#{arr1}) => #{bucketSort(arr1)}"
    puts " - FALSE - correct solution: #{sol1}" unless bucketSort(arr1) == sol1

    # arr2 = [0.01, 0.1, 0.8, 0.32, 0.55, 0.08, 0.832]
    # sol2 = [0, 2, 18, 20, 29, 75, 500, 752]
    # puts "bucketSort(#{arr2}) => #{bucketSort(arr2)}"
    # puts " - FALSE - correct solution: #{sol2}" unless bucketSort(arr2) == sol2
end