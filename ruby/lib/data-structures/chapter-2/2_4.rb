module LinkedListUtils
  def partition_on k
    left = self.class.new
    right = self.class.new
    self.each do |node|
      left.push_top node.data if node.data < k
      right.push_top node.data if node.data >= k
    end
    left.tail.next = right.head
    left
  end
end
