def ensureFourDigits(num)
  #improve by eliminating hard code and address 4+ digit case
  case num.to_s.length
  when 4
    num
  when 3
    return "0#{num}"
  when 2
    return "00#{num}"
  when 1
    return "000#{num}"
  end
end
