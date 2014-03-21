require_relative 'node'
class SinglyLinkedList
  include Enumerable
  attr_reader :head, :tail
  def initialize head=nil
    @head = @tail = Node.new head unless head.nil?
  end

  def push_bottom node
    @tail = @head = Node.new(node) and return if @head.nil?
    @tail.next = Node.new(node)
    @tail = @tail.next
  end

  def push_top node
    node = Node.new(node)
    @tail = @head = node and return if @head.nil?
    node.next = @head
    @head = node
  end

  def find data
    self.detect {|node| node.data == data }
  end

  def each
    return @head if @head.nil?
    current_node = @head
    until current_node.nil?
      yield current_node
      current_node = current_node.next
    end
  end

  def remove data
    @head = @head.next and return if @head.data == data
    prev = @head
    current_node = @head.next
    self.each do
      if current_node.data == data
        return prev.next = current_node.next
      end
      prev = current_node
      current_node = current_node.next
    end
  end
end
