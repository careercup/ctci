require_relative '../../spec_helper'
describe Node do
  let(:data) { "sweet" }
  let(:next_node) { "awesome" }
  let(:node) { Node.new data }
  context "#data" do
    it "is initialized to the given data" do
      expect(node.data).to eq data
    end
  end
  context "#next" do
    it "defaults to nil" do
      expect(node.next).to be_nil
    end
  end
  context "#next=" do
    it "sets the next" do
      node.next = next_node
      expect(node.next).to eq next_node
    end
  end
  context "#prev" do
    it "defaults to nil" do
      expect(node.prev).to be_nil
    end
  end
  context "#prev=" do
    it "sets the prev" do
      previous = "previous"
      node.prev = previous
      expect(node.prev).to eq previous
    end
  end
end

describe DoublyLinkedList do
  let(:head) { "head" }
  let(:node) { "next" }
  let(:list) { DoublyLinkedList.new head}
  context "#head" do
    it "defaults to nil" do
      list = DoublyLinkedList.new
      expect(list.head).to be_nil
    end
    it "can be set with initial data" do
      expect(list.head.data).to eq head
    end
  end
  context "#tail" do
    it "returns the element at the end of the list" do
      expect(list.tail.data).to eq head
    end
  end
  context "#push_bottom" do
    it "sets head if it's nil" do
      list = DoublyLinkedList.new
      list.push_bottom(head)
      expect(list.head.data).to eq head
    end
    it "head is not affected if it's already set" do
      list.push_bottom(node)
      expect(list.head.data).to eq head
    end
    it "push_bottoms the node to the end of the list" do
      list.push_bottom(node)
      tail = "tail"
      list.push_bottom(tail)
      expect(list.head.next.next.data).to eq tail
    end
    it "is the tail element" do
      list.push_bottom(node)
      tail = "tail"
      list.push_bottom(tail)
      expect(list.tail.data).to eq tail
    end
  end
  context "#push_top" do
    it "sets head if it's nil" do
      list = DoublyLinkedList.new
      list.push_top(head)
      expect(list.head.data).to eq head
    end
    it "sets the head if it's already set" do
      list.push_top(node)
      expect(list.head.data).to eq node
    end
    it "head is the tails element" do
      list.push_top(node)
      expect(list.head.data).to eq node
      expect(list.tail.data).to eq head
    end
    it "is head's previous element" do
      list.push_top(node)
      expect(list.head.next.prev).to eq list.head
    end
  end

  context "#find" do
    it "returns the node if data is found" do
      expect(list.find(head).data).to eq head
      list.push_bottom(node)
      expect(list.find(node).data).to eq node
    end
    it "returns nil if data not found" do
      expect(list.find("not there")).to be_nil
    end
  end

  context "#remove" do
    it "removes the head if its the give data" do
      list.push_bottom(node)
      list.remove head
      expect(list.find(head)).to be_nil
      expect(list.head.data).to eq node
    end
    it "removes the node if data is not at head" do
      list.push_bottom("another")
      list.push_bottom(node)
      list.remove node
      expect(list.find(node)).to be_nil
      expect(list.find("another").data).to eq "another"
      expect(list.find(head).data).to eq head
    end
  end

  context "#map" do
    it "yields the block to each element" do
      expect(list.map {|node| node.data }).to eq ["head"]
    end
  end
end
