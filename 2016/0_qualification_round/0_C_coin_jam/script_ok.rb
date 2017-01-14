def getArray(line)
  res = Array.new()
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

def getTrivialDivisor(valBase)
  for div in 2..Math.sqrt(valBase).ceil
    if valBase % div == 0
      return div
    end
  end
  return -1
end

def process(n, j)
  puts "N=#{n}, J=#{j}"
  res = Array.new()
  # nombre courant en retirant 1er et dernier chiffres (toujours 1)
  # on itere en base 2 car 0/1 seulement
  for midValB2 in 0..(2**(n-2)-1)
    # 1er et Neme chiffres sont 1
    puts midValB2
    valB2 = 1 + 2 * midValB2 + (2**(n-1))
    #puts "valB2=#{valB2} avec n=#{n} et #{2^(n-1)}"
    strVal = valB2.to_s(2)
    puts "strVal=#{strVal}"

    isPrime = false
    divisors = Array(9)
    for base in 2 .. 10
      valBase = strVal.to_i(base) # interprete la chaine comme un nombre en baseN et retourne l'entier correspondant (decimal)

      trivialDivisor = getTrivialDivisor(valBase)
      if (trivialDivisor > 1)
        divisors[base-2] = trivialDivisor
      else
        isPrime = true
        puts "#{valBase} est premier"
        break
      end
    end

    if !isPrime
      res.push([strVal, divisors])
      if res.length >= j
        puts "res.length=#{res.length}"
        return res
      end
    else

    end

  end
end

def outputResult(output, result, i)
  #output.puts("Case ##{i}: #{result}")
  output.puts("Case ##{i}:")
  result.each do |elt|
    output.puts("#{elt[0]} #{elt[1].join(" ")}")
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
      n = line.split(' ')[0].to_i
      j = line.split(' ')[1].to_i
      result = process(n, j)
  		i = i+1
      outputResult(output, result, i)
	  end
	end
  output.close()
end


ARGV.each do|arg|
  puts "Processing file: #{arg}"
  processInputFile(arg)
end
