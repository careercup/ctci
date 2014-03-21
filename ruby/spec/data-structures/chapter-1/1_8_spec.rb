require_relative '../../spec_helper'
describe Strings do
  context "#rotation?" do
    let(:str) { "waterbottle" }
    let(:rot) { "erbottlewat" }
    context "solely using string include?" do
      it "returns false if strings are different lengths and/or length is 0" do
        expect(Strings.rotation?(str, "hey")).to be_false
        expect(Strings.rotation?("", "")).to be_false
      end

      it "returns false if str2 is not a rotation of str 1" do
        expect(Strings.rotation?(str, "olleh")).to be_false
      end

      it "returns true if string is rotation of another string" do
        String.any_instance.should_receive(:include?).exactly(:once).and_call_original
        expect(Strings.rotation?(str, rot)).to be_true
      end
    end
  end
end
