def getArray(line)
  res = Array.new
  line.split(' ').each do |val|
    res.push(val.to_i)
  end
  return res
end

def computeProduct(v1, v2)
  sum = 0
  for index in 0 ... v1.size
    sum = sum + v1[index].to_i * v2[index].to_i
  end
  return sum
end
 
def getOutputFilename(inputFileName)
  if inputFileName.end_with?(".in")
    return inputFileName.gsub(/.in/, ".out")
  else
    return inputFileName + ".out"
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
		nVal = line.to_i
		v1 = getArray(f1.gets).sort()
		v2 = getArray(f1.gets).sort().reverse()
		prod = computeProduct(v1, v2)
		i = i+1
		output.puts("Case ##{i}: #{prod}")
	  end  
	end
  output.close()
end


ARGV.each do|arg|
  puts "Processing file: #{arg}"
  processInputFile(arg)
end
