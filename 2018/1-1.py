# https://codejam.withgoogle.com/2018/challenges/00000000000000cb/dashboard

def computeProgramDmg(p):
    curDmg = 1
    totalDmg = 0
    lastS = -1
    lastC = -1
    for i,c in enumerate(p):
        if c == 'S':
            totalDmg = totalDmg + curDmg
            lastS = i
        elif c == 'C':
            curDmg = curDmg * 2
            lastC = i
    return totalDmg, lastC, lastS


def solve(shield, p):
    totalDmg, lastC, lastS = computeProgramDmg(p)
    swapCount = 0

    if totalDmg <= shield:
        return 0
    
    while totalDmg >= shield and lastC >= 0 and lastS >= 0:
        computeProgramDmg(p)


    return 'IMPOSSIBLE'



sampleFileName = 'sample'
outFileName = 'output'

sampleFile = open(sampleFileName, 'r')

outFile = open(outFileName, 'w') 

nbCases = int(sampleFile.readline())

for i in range (0, nbCases):
    line = sampleFile.readline()
    totalDamage = int(line.split(' ')[0])
    program = line.split(' ')[1]

    print('case {0} : {1} vs {2}'.format(i, totalDamage, program))

    print(solve(totalDamage, program))
    #outFile.write(solve(totalDamage, program))

outFile.close()
sampleFile.close()

