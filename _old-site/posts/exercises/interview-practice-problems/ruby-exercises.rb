def lucky_sevens?(arr)
    #returns true if any three consecutive numbers sum up to 7, else false
    return false if arr.length < 3

    return true if arr[0...3].inject(0) {|sum, el| sum += el} == 7
    lucky_sevens?(arr[1..-1])
end

def oddball_sum(arr)
    #sums all odd elements
    arr.select{|el| el%2 == 1}.inject(0){|sum, el| sum += el}
end

def disemvowel(str)
    #returns string w/out any vowels
    vowels = "aeiou"
    str.chars.select{|char| vowels.include?(char.downcase) == false}.join('')
end


# print lucky_sevens?([0,-2,1,8]) == true # => -2 + 1 + 8 == 7
# print lucky_sevens?([2,1,5,1,0]) == true # => 1 + 5 + 1 == 7
# print lucky_sevens?([7,7,7,7]) == false
# print lucky_sevens?([3,4,3,4]) == false
# print oddball_sum([1,2,3,4,5]) == 9 # => 1 + 3 + 5 == 9
# print oddball_sum([0,6,4,4]) == 0
# print oddball_sum([1,2,1]) == 2
# print disemvowel("foobar") == "fbr"
# print disemvowel("ruby") == "rby"
# print disemvowel("aeiou") == ""