def countWaysBrute(n):
    if (n < 0):
        return 0
    elif ( n == 0 ) :
        return 1
    else :
        return countWaysBrute(n-1)+countWaysBrute(n-2)+countWaysBrute(n-3)
def countWaysMemo(n):
    memo=[]
    for i in range(n+1):
        memo.append(-1)
    return countWaysMemohelper(n,memo)
def countWaysMemohelper(n , memo):
    if ( n < 0):
        return 0;
    elif ( n  == 0) :
        return 1;
    elif( memo[n] > -1):
        return memo[n]
    else:
        memo[n]=countWaysMemohelper(n-1,memo) + countWaysMemohelper(n-2,memo) +countWaysMemohelper(n-3,memo)
        return memo[n]
if __name__=='__main__':
    print(countWaysBrute(6))
    print(countWaysMemo(8))
