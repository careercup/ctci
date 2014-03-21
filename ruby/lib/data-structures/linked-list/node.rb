class Node
  attr_reader :data
  attr_accessor :next, :prev
  def initialize data
    @data = data
    @next = nil
  end
end
