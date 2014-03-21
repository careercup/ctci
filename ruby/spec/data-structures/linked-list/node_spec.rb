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
end
