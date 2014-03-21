require_relative '../../spec_helper'
describe LinkedListUtils do
  class SinglyLinkedList
    include LinkedListUtils
  end
  context "#remove_dups" do
    let(:nodes) { %w{one two one three one two four} }
    let(:list) { SinglyLinkedList.new }
    before(:each) do
      nodes.each do |node|
        list.push_bottom node
      end
    end
    it "remove duplicate values from the list" do
      dups = list.remove_dups
      expect(list.map(&:data)).to eq %w{one two three four}
    end
  end
end
