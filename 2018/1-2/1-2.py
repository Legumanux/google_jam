# https://codejam.withgoogle.com/2018/challenges/00000000000000cb/dashboard/00000000000079cb
# Get-Content .\sample | python .\1-2.py > output"


def isSorted(x, key = lambda x: x): return all([key(x[i]) <= key(x[i + 1]) for i in range(len(x) - 1)])

def firstIssue(num_list):
    for i in range(0, len(num_list)-2):
        if  num_list[i]>num_list[i+1]:
            return i
    else:
         return -1


def oneSort(num_list):
    changed = False
    result = num_list.copy()
    for i in range(0, len(result)-3):
        if result[i] > result[i+2]:
            toto = result[i:i+3]
            toto.reverse()
            print(toto)
            result = result[:i]+toto+result[i+3:]
            changed = True
    return result, changed
    

def solve(num_list):
    if isSorted(num_list):
        return 'OK'
    else:
        changed = True
        while changed:
            num_list, changed  = oneSort(num_list)
        if isSorted(num_list):
            return 'OK'
        else:
            return  str(firstIssue(num_list))


    




# input() reads a string with a line of input, stripping the '\n' (newline) at the end.
# This is all you need for most Kickstart problems.
t = int(input())  # read a line with a single integer
for i in range(1, t + 1):
    #n, m = [int(s) for s in input().split(" ")]  # read a list of integers, 2 in this case
    n = input()
    num_list = [int(s) for s in input().split(' ')]
    print('Case #{0}: {1}'.format(i, solve(num_list)))
    # check out .format's specification for more formatting options
