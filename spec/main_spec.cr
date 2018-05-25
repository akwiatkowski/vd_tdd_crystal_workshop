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

    context "when using chained execution" do
      in_array = (-10..30).to_a
      out_array = Tdd::Main.new(in_array).validify(
        valid_proc: ->(i : Int32) { i >= 5 }
      ).validify(
        valid_proc: ->(i : Int32) { i < 20 }
      ).validify(
        valid_proc: ->(i : Int32) { i.even? }
      ).in_object.as(Array(Int32))

      it "returns only more or equal than 5" do
        out_array.each do |i|
          (i >= 5).should eq(true)
        end
      end

      it "returns only less than 20" do
        out_array.each do |i|
          (i < 20).should eq(true)
        end
      end

      it "returns only even" do
        out_array.each do |i|
          i.even?.should eq(true)
        end
      end
    end
  end
end
