require_relative '../../spec_helper'
describe HashTable do
  let(:key) { :a }
  let(:data) { ":a data" }
  let(:table) { HashTable.new }
  context "#[]=" do
    before(:each) do
      table[key] = data
    end
    it "push_bottoms the data under the key" do
      expect(table[key]).to eq data
    end
    it "datas don't override each other override" do
      table["a"] = "a data"
      table["A"] = "A data"
      expect(table[key]).to eq data
      expect(table["a"]).to eq "a data"
    end
    it "has to be a unique key" do
      table["a"] = "a data"
      expect {
        table["a"] = "a data"
      }.to raise_error(UniqueKeyError)
    end
  end
  context "#[]" do
    before(:each) do
      table[key] = data
    end
    it "gets the data at the given key" do
      expect(table[key]).to eq data
    end
  end

  context "#hash" do
    it "returns 0 if the array is empty" do
      expect(table.hash_func(key)).to eq key.length % HashTable::HASH_FUNCTION_FACTOR
    end

    it "mods the length of the array" do
      table[key] = data
      table["another_key"] = data
      expect(table.hash_func(key)).to eq key.length % HashTable::HASH_FUNCTION_FACTOR
    end
  end
end
