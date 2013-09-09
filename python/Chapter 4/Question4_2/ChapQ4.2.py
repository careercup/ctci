#Given a directed graph, design an algorithm to find out whether there is a route
#between two nodes.

class DirectedGraph:
    def __init__(self,content):
        self.content = content
        self.neighbours = []

#"dynamic programming" used here, i.e. recursion plus caching
#"cache" is our dict of visited nodes
#"cache2" is our dict of routes (i.e. 3,5) that have already been checked.
def is_route_between(node1,node2,cache={},cache2={}):    
    if node1==node2:
        return True
    if (str(hash(node1)) + "," + str(hash(node2))) in cache2:
        return cache2[(str(hash(node1)) + "," + str(hash(node2)))]    
    nodefound=False
    for neighbour in node1.neighbours:
        if neighbour in cache:
            #dont visit, we've checked this already in our route search
            continue
        cache[neighbour]=True
        nodefound=is_route_between(neighbour,node2,cache,cache2)
        if nodefound:
            break
    cache2[(str(hash(node1)) + "," + str(hash(node2)))]=nodefound
    return nodefound

#bfs algorithm
def is_route_between2(node1, node2):
    if node1 is node2:
        return True
    elif node1 is None or node2 is None:
        return False
    visited = set([node1, node2])
    from Queue import deque
    queue = deque([node1])
    while len(queue) > 0:
        node = queue.popleft()
        for child in node.neighbours:
            if child is node2:
                return True
            elif child not in visited:
                visited.add(child)
                queue.append(child)
    return False

#testing

n1 = DirectedGraph(1)
n2 = DirectedGraph(2)
n3 = DirectedGraph(3)
n4 = DirectedGraph(4)
n5 = DirectedGraph(5)
n6 = DirectedGraph(6)

n1.neighbours.append(n2)
n2.neighbours.append(n3)
n2.neighbours.append(n4)
n4.neighbours.append(n5)
n4.neighbours.append(n1)

test_func = [is_route_between, is_route_between2]

for func in test_func:
    if func(n1,n5):
        print "Test 1 passed"

    if not func(n5,n1):
        print "Test 2 passed"

    if not func(n1,n6):
        print "Test 3 passed"
