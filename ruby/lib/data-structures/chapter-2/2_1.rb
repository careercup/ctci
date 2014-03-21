require_relative '../linked-list/singly_linked_list'
module LinkedListUtils
  def remove_dups
    return if self.head.nil? || self.head.next.nil?
    nodes = Hash.new
    prev = self.head
    self.each do |node|
      if nodes[node.data]
        prev.next = node.next
      else
        nodes[node.data] = true
        prev = node
      end
    end
  end
end
