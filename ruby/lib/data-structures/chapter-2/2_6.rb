module LinkedListUtils
  def looped?
    slow = self.head
    fast = self.head

    return false if fast.nil? || fast.next.nil?

    until(fast.nil? || fast.next.nil?) do
      slow = slow.next;
      fast = fast.next.next;
      return true if slow == fast
    end
  end
end
