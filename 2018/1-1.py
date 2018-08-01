# https://codejam.withgoogle.com/2018/challenges/00000000000000cb/dashboard

# only possible optim is inverting CS
def computeProgramDmg(p):
    curDmg = 1
    totalDmg = 0
    for c in p:
        if c == 'S':
            totalDmg = totalDmg + curDmg
        elif c == 'C':
            curDmg = curDmg * 2
    return totalDmg

# minimum damage corresponds of the number of shots S
def minProgramDmg(p):
    return p.count('S')

def optimizeOnce(p):
    indexSwap = p.rfind('CS')
    if indexSwap >= 0:
        return p[:indexSwap]+'SC'+p[indexSwap+2:]
    else:
        return -1

def solve(shield, p):
    if minProgramDmg(p) > shield:
        return 'IMPOSSIBLE'

    swapCount = 0
    while computeProgramDmg(p) > shield:
        p = optimizeOnce(p)
        swapCount = swapCount + 1

    return swapCount


# input() reads a string with a line of input, stripping the '\n' (newline) at the end.
# This is all you need for most Kickstart problems.
t = int(input())  # read a line with a single integer
for i in range(1, t + 1):
    #n, m = [int(s) for s in input().split(" ")]  # read a list of integers, 2 in this case
    line = input()
    totalDamage = int(line.split(' ')[0])
    program = line.split(' ')[1]

    print('Case #{0}: {1}'.format(i, solve(totalDamage, program)))
    # check out .format's specification for more formatting options

"""
sampleFileName = r'C:\DEV\CODE_JAM\2018\sample'
outFileName = r'C:\DEV\CODE_JAM\2018\output'

sampleFile = open(sampleFileName, 'r')

outFile = open(outFileName, 'w') 

nbCases = int(sampleFile.readline())

for i in range (0, nbCases):
    line = sampleFile.readline()
    totalDamage = int(line.split(' ')[0])
    program = line.split(' ')[1]

    #print('case {0} : {1} vs {2}'.format(i, totalDamage, program))

    outFile.write('Case #{0}: {1}\n'.format(i, solve(totalDamage, program)))
    #outFile.write(solve(totalDamage, program))

outFile.close()
sampleFile.close()
"""
