# 701-RandomConnectedArea.rb

# Consider a rectangle made up of W×H square cells each with area 1.
# Each cell is independently coloured black with probability 0.5 otherwise white. Black cells sharing an edge are assumed to be connected.
# Consider the maximum area of connected cells.
#
# Define E(W,H) to be the expected value of this maximum area. For example, E(2,2)=1.875
#
# You are also given E(4,4)=5.76487732, rounded to 8 decimal places.
# Find E(7,7), rounded to 8 decimal places.

class Matrix
  attr_reader :matrix, :w, :h, :area

  def initialize(w,h)
    @matrix = Array.new(h){Array.new(w)}
    @w = w
    @h = h
    @area = w * h
  end

  def fillTile(row, column)
    @matrix[row][column] = 1
  end

  def filledTileCount
    @matrix.flatten.count{|i| i == 1}
  end

  def printMatrix
    @matrix.each do |row|
      row.each {|i| print (i ? i : '_')}
      puts ''
    end
  end
end

class MatrixPermutations
  def intitialize(matrix)
    @empty_matrix = matrix
    @all_permutations = permutations
  end

  def maxArea
    allFilledTiles() / @empty_matrix.area
  end

  def permutations(mat)
    #returns array of all possible matrices
    return mat if mat.filledTileCount == mat.area


  end

  def allFilledTiles
    #returns sum of filled tiles for all permutations
    @all_permutations.inject(0){|sum, matrix| sum + matrix.filledTileCount}
  end
end


if __FILE__ == $PROGRAM_NAME
  y1 = Matrix.new(2,2).maxArea
  puts "Returns: maxArea(2,2) => #{y1}"
  puts "Answer is: #{y1 == 1.875}"
  # puts "Solution: maxArea(2,2)=1.875"

  # y2 = Matrix.new(4,4).maxArea
  # puts "Returns: maxArea(4,4) => #{y2}"
  # puts "Answer is: #{y2 == 5.76487732}"
  # puts "Solution: maxArea(4,4)=5.76487732"
end
