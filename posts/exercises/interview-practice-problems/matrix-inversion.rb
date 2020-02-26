def matrixInversion(matrix)
    #creates an array of empty arrays, the size of the original matrix width
    width = matrix.first.length
    new_matrix = Array.new(width){Array.new()}

    width.times do |w|
        matrix.each_index {|h| new_matrix[w] << matrix[h][w]}
    end
    
    puts "start: #{matrix}"
    puts "finish: #{new_matrix}"
    return new_matrix
end


if __FILE__ == $PROGRAM_NAME
    puts ""
    matrix1 = [[0,1,2],[3,4,5],[6,7,8]]
    puts matrixInversion(matrix1) == [[0,3,6],[1,4,7],[2,5,8]]
    puts ""
    matrix2 = [[0,1,2,3],[:a,:b,:c,:d]]
    puts matrixInversion(matrix2) == [[0,:a],[1,:b],[2,:c],[3,:d]]
end