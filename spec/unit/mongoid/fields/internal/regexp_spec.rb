require "spec_helper"

describe Mongoid::Fields::Internal::Regexp do

  let(:field) do
    described_class.instantiate(:test, :type => Regexp)
  end

  describe "#deserialize" do

    it "returns the regexp" do
      field.deserialize(/foo/).should == /foo/
    end
  end

  describe "#serialize" do

    context "when the value is a Regexp" do

      it "converts the number to a float" do
        field.serialize(/bar/).should == /bar/
      end
    end

    context "when the value is not a Regexp" do
      context "when the regexp is nil" do

        it "returns nil" do
          field.serialize(nil).should be_nil
        end
      end
    end
  end
end