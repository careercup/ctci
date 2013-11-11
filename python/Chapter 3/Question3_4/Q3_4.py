class Hanoi:
    
    def __init__(self, size):
        self.towers = [[], [], []]
        self.size = size
        self.towers[0] = [x for x in range(size, 0, -1)]

    def playHanoi(self):
        self.printTowers()
        self.moveDisk(self.size, 1, 2, 3)
        self.printTowers()

    def moveDisk(self, size, fr, helper, to):
        if size == 1:
            data = self.towers[fr-1].pop()
            self.towers[to-1].append(data)
            print "Disk", data, ": Tower", fr, "->", to      
        else:
            self.moveDisk(size - 1, fr, to, helper)
            self.moveDisk(1, fr, helper, to)
            self.moveDisk(size - 1, helper, fr, to)

    def printTowers(self):
        for i in self.towers:
            print i




#----------------test---------------
hanoi = Hanoi(4)
hanoi.playHanoi()
