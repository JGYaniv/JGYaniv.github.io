#iterates through string and returns number of substrings contained
def substringCounter(str, subStr)
    sub_size = subStr.length
    substring_count = 0

    while str.length >= sub_size
        current_substring = str[0...sub_size]
        substring_count += 1 if current_substring == subStr
        str = str[1..-1]
    end

    substring_count
end

def substringCounterV2(str, subStr)
    return 0 if str.length < subStr.length

    if str[0...subStr.length] == subStr
        return 1 + substringCounterV2(str[1..-1], subStr)
    else
        return substringCounterV2(str[1..-1], subStr)
    end
end

# "abcmedef" , "me"
# "a" substringCounter("bcmedef")
# while loop until string is less than the size of substring, dropping first character after each iteration


if __FILE__ == $PROGRAM_NAME
    str1 = 'abscastring3*&!string@*!@'
    subStr1 = 'string'
    answer1 = 2
    puts "\nsubstringCounterV2('#{str1}', '#{subStr1}') => #{substringCounterV2(str1, subStr1)}"
    puts " - FALSE - correct answer is: #{answer1}:" unless answer1 == substringCounterV2(str1, subStr1)

    str2 = 'asd*12^abda22..,,asd'
    subStr2 = 'a'
    answer2 = 4
    puts "\nsubstringCounterV2('#{str2}', '#{subStr2}') => #{substringCounterV2(str2, subStr2)}"
    puts " - FALSE - correct answer is: #{answer2}" unless answer2 == substringCounterV2(str2, subStr2)

    # str1 = 'abscastring3*&!string@*!@'
    # subStr1 = 'string'
    # answer1 = 2
    # puts "\nsubstringCounter('#{str1}', '#{subStr1}') => #{substringCounter(str1, subStr1)}"
    # puts " - FALSE - correct answer is: #{answer1}:" unless answer1 == substringCounter(str1, subStr1)

    # str2 = 'asd*12^abda22..,,asd'
    # subStr2 = 'a'
    # answer2 = 4
    # puts "\nsubstringCounter('#{str2}', '#{subStr2}') => #{substringCounter(str2, subStr2)}"
    # puts " - FALSE - correct answer is: #{answer2}" unless answer2 == substringCounter(str2, subStr2)

    puts ""
end