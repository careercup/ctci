require_relative '../../spec_helper'
describe LinkedListUtils do
  class SinglyLinkedList
    include LinkedListUtils
  end
  context "#looped?" do
    let(:nodes) { [1, 2, 3, 4, 5] }
    let(:list) { SinglyLinkedList.new }
    before(:each) do
      nodes.each do |node|
        list.push_bottom node
      end
    end
    it "retuns true if linked list is looped" do
      list.tail.next = list.head
      expect(list.looped?).to be_true
    end
    it "retuns false if linked list is not looped" do
      expect(list.looped?).to be_false
    end
  end
end
