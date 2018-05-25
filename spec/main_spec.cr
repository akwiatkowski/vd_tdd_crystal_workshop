require "./spec_helper"

describe Tdd::Main do
  describe "#less_than_5" do
    context "when input is Array" do
      context "when input is [1]" do
        in_array = [1]
        out_array = Tdd::Main.new(in_array).less_than_5.as(Array(Int32))

        it "returns 1 element array" do
          out_array.size.should eq(1)
        end

        it "returns equal to [1]" do
          out_array.should eq([1])
        end
      end

      context "when input is [10]" do
        in_array = [10]
        out_array = Tdd::Main.new(in_array).less_than_5.as(Array(Int32))

        it "returns 0 element array" do
          out_array.size.should eq(0)
        end

        it "returns equal to []" do
          out_array.should eq(Array(Int32).new)
        end
      end
    end

    context "when input is single Int32" do
      context "when input is 1" do
        in_array = 1
        out_array = Tdd::Main.new(in_array).less_than_5

        it "returns equal to 1" do
          out_array.should eq(1)
        end
      end

      context "when input is 10" do
        in_array = 10
        out_array = Tdd::Main.new(in_array).less_than_5

        it "returns nil" do
          out_array.should eq(nil)
        end
      end
    end
  end
end
