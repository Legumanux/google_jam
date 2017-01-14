def getArray(line)
  res = Array.new
  line.split(' ').each do |val|
    res.push(val.to_i)
  end
  return res
end

def getOutputFilename(inputFileName)
  if inputFileName.end_with?(".in")
    return inputFileName.gsub(/.in/, ".out")
  else
    return inputFileName + ".out"
  end
end

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

def process(val)
  if (val == 0)
    return "INSOMNIA"
  else
    digitsMap = Array.new(10, 0)
    i = 0
    while digitsMap.include?(0)
      i = i + 1
      digitsMap = checkDigits(i * val, digitsMap)
    end
    return i * val
  end
end

def processInputFile(fileName)
  outputFilename = getOutputFilename(fileName)
  output = open(outputFilename, 'w')
	File.open(fileName, 'r') do |f1|
	  testCaseNumber = f1.gets.to_i
	  puts "Test composed of #{testCaseNumber} cases"
	  i = 0
	  while line = f1.gets
		val = line.to_i
    res = process(val)
		i = i+1
		output.puts("Case ##{i}: #{res}")
	  end
	end
  output.close()
end


ARGV.each do|arg|
  puts "Processing file: #{arg}"
  processInputFile(arg)
end
