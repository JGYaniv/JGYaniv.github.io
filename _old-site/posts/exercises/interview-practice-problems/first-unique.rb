#returns first instance of unique character in a string
def firstUnique(str)
    # call the charCount method and store the hash as a variable
    hash_map = charCount(str)

    # iterate through the string, the first character that returns the value 1 from the charCount hash is returned
    str.chars.each do |char|
        return char if hash_map[char] == 1
    end
end

def charCount(str)
    # creates a hash, with keys being each character and values being the number of times they appear
    hash_map = Hash.new(0)

    str.chars.each do |char|
        hash_map[char] += 1
    end

    hash_map
end

if __FILE__ == $PROGRAM_NAME
    str1 = "abcd1234^&*%$"
    ans1 = "a"
    puts "\nfirstUnique(#{str1}) => #{firstUnique(str1)}"
    puts " - FALSE - correct solution: #{ans1}" unless firstUnique(str1) == ans1

    str2 = "ab1^cd1234^&*c%24$dba"
    ans2 = "3"
    puts "\nfirstUnique(#{str2}) => #{firstUnique(str2)}"
    puts " - FALSE - correct solution: #{ans2}" unless firstUnique(str2) == ans2

    str3 = "aabbccddeeffgghhi"
    ans3 = "i"
    puts "\nfirstUnique(#{str3}) => #{firstUnique(str3)}"
    puts " - FALSE - correct solution: #{ans3}" unless firstUnique(str3) == ans3

    puts ""
end