require_relative '../../spec_helper'
describe Strings do
  context "#compress_string" do

    let(:uncompressed) { "abbbcccaadee" }
    let(:compressed) { "a1b3c3a2d1e2" }

    it "returns blank if string is blank or nil" do
      expect(Strings.compress_string("")).to eq("")
      expect(Strings.compress_string(nil)).to eq("")
    end

    it "returns compressed version of string" do
      expect(Strings.compress_string(uncompressed)).to eq(compressed)
    end

  end
end
