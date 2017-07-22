require "spec_helper"
require "enumerable_methods"
module Enumerable
  describe "#my_select" do
    context "when the element fits the condition in the block" do
      it "push it into an new array, return the new array" do
        expect([1,2,3].my_select{ |a| a < 2 }).to eql([1])
      end
    end
    context "when no element fit the condition in the block" do
      it "return empty array" do
        expect([1,2,3].my_select{ |a| a < 0 }).to eql([])
      end
    end
  end

  describe "#my_all?" do
    context "when every element fit the conditon in the block" do
      it "returns true" do
        expect([1,2,3].my_all?{ |a| a < 5 }).to eql(true)
      end
    end

    context "when there is even one element doesn't fit the condition" do
      it "returns false" do
        expect([1,2,3].my_all?{ |a| a < 3 }).to eql(false)
      end
    end
  end

  describe "#my_map_proc" do
    it "every elements execute the block, and form a new array" do
      expect([0,1,2,3].my_map_proc { |a| a*2 }).to eql([0,2,4,6])
    end
  end

  describe "#my_inject" do
    context "when there is no parameter" do
      it "accumulate the executed element from the first element " do
        expect([0,1,2,3].my_inject { | result, a | result*a }).to eql(0)
      end
    end

    context "when there is a parameter" do
      it "accumulate the executed element from the first parameter" do
        expect([1,2,3].my_inject(0) { | result, a | result*a }).to eql(0)
      end
    end

    it "multiply each elements of [2,4,5], return 40" do
      expect([2,4,5].my_inject { | result, a | result*a }).to eql(40)
    end
  end

  describe "#my_count" do
    it "count how many elements fit the condition of the block " do
      expect([2,4,5].my_count { | a | a < 5 }).to eql(2)
    end

    context "when there is no elements fit the condition" do
      it "return 0" do
        expect([2,4,5].my_count { | a | a < 0 }).to eql(0)
      end
    end
  end

  describe "#my_any?" do
    context "when there is any elements fit the condition in the block" do
      it "return true" do
        expect([2,4,5].my_any? { | a | a < 6 }).to eql(true)
      end
    end

    context "when there is no elements fit the condition in the block" do
      it "return false" do
        expect([2,4,5].my_any? { | a | a < 0 }).to eql(false)
      end
    end
  end



end
