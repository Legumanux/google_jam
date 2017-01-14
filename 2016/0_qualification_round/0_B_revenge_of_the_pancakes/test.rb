def checkDigits(number, digitsMap)
  if (number == 0)
    digitsMap[0] = 1
  else
    digitsMap[number % 10] = 1
    nextNumber = number / 10
    if nextNumber > 0
      checkDigits(nextNumber, digitsMap)
    end
  end
  return digitsMap
end

def printDigitsMap(digitsMap)
  res = "("
  empty = true
  for i in 0..9
    if (digitsMap[i] != 0)
      if (empty)
        empty = false
      else
        res = res + ","
      end
      res = res + i.to_s
    end
  end
  res = res + ")"
  return res
end

digitsMap = Array.new(10, 0)
puts digitsMap
puts printDigitsMap(digitsMap)
puts "check"
puts printDigitsMap(checkDigits(78974237, digitsMap))
