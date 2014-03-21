require_relative '../../spec_helper'
describe SinglyLinkedList do
  let(:head) { "head" }
  let(:node) { "next" }
  let(:list) { SinglyLinkedList.new head}
  context "#head" do
    it "defaults to nil" do
      list = SinglyLinkedList.new
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
      list = SinglyLinkedList.new
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
      list = SinglyLinkedList.new
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
