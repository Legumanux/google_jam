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

def process(val)
  lastReadChar = nil
  blocksCount = 0
  val.each_char do |cur|
    if cur == '+' || cur == '-'
      if lastReadChar == nil || cur != lastReadChar
        blocksCount = blocksCount + 1
      end
      lastReadChar = cur
    end
  end
  # here, lastReadChar is the bottom pancake
  # in every case, we need blocksCount-1 moves to have all pancakes on the same side (+ or -)
  movesCount = blocksCount-1
  #if (movesCount % 2 == 0 && lastReadChar == '-') || (movesCount % 2 == 1 && lastReadChar == '+')
puts lastReadChar
  if lastReadChar == '-'
    movesCount = movesCount + 1
  end
  return movesCount
end

def processInputFile(fileName)
  outputFilename = getOutputFilename(fileName)
  output = open(outputFilename, 'w')
	File.open(fileName, 'r') do |f1|
	  testCaseNumber = f1.gets.to_i
	  puts "Test composed of #{testCaseNumber} cases"
	  i = 0
	  while line = f1.gets
    movesCount = process(line)
		i = i+1
		output.puts("Case ##{i}: #{movesCount}")
	  end
	end
  output.close()
end


ARGV.each do|arg|
  puts "Processing file: #{arg}"
  processInputFile(arg)
end
