require 'spec_helper'
require 'caesar_cipher'
describe "caesar_cipher" do
  context "after wrap from z to a, upcase" do
    it "changes Z into C, with fator 3" do
      expect(caesar_cipher('Z',3)).to eql("C")
    end
  end

  context "after wrap from z to a, downcase" do
    it "changes y into b, with fator 3" do
      expect(caesar_cipher('y',3)).to eql("b")
    end
  end

  context "without wrap, upcase" do
    it "changes A into C, with fator 2" do
      expect(caesar_cipher('A',2)).to eql("C")
    end
  end

  context "without wrap, downcase" do
    it "changes a into c, with fator 2" do
      expect(caesar_cipher('a',2)).to eql("c")
    end
  end

  context "when it is not letter" do
    it "dose not change" do
      expect(caesar_cipher('!',2)).to eql("!")
    end
  end

  context "when it is not letter" do
    it "dose not change" do
      expect(caesar_cipher('5',2)).to eql("5")
    end
  end

end
