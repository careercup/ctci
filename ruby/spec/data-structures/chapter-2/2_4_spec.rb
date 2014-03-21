require_relative '../../spec_helper'
describe LinkedListUtils do
  class SinglyLinkedList
    include LinkedListUtils
  end
  context "#partition_on" do
    let(:nodes) { [3, 4, 2, 1 , 5] }
    let(:list) { SinglyLinkedList.new }
    before(:each) do
      nodes.each do |node|
        list.push_bottom node
      end
    end
    it "retuns the partioned linked list" do
      expect(list.partition_on(3).map(&:data)).to eq [1, 2, 5, 4, 3]
    end
  end
end
