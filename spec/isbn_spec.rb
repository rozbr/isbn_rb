
require_relative "../src/isbn"


describe ISBN do
  describe "ensure_correctness_input," do
    context "when passing a non string/number as paramer," do
      it "should raise argument error" do
        expect {ISBN.ensure_correctness_input true}.to raise_error ArgumentError
        expect {ISBN.ensure_correctness_input false}.to raise_error ArgumentError
        expect {ISBN.ensure_correctness_input nil}.to raise_error ArgumentError
      end
    end

    context "when passing an invalid string," do
      it "should raise argument error if length is different than 12 and 13" do
        expect {ISBN.ensure_correctness_input "97821234568"}.to raise_error ArgumentError
        expect {ISBN.ensure_correctness_input "97821234568034"}.to raise_error ArgumentError
      end

      it "should raise argument error if any non numeric digit is found" do
        expect {ISBN.ensure_correctness_input "97821234568O3"}.to raise_error ArgumentError
        expect {ISBN.ensure_correctness_input "9782123A5680"}.to raise_error ArgumentError
      end
    end

    context "when passing a valid string," do
      it "should not raise errors" do
        expect {ISBN.ensure_correctness_input "9782123456803"}.not_to raise_error
        expect {ISBN.ensure_correctness_input "012345678901"}.not_to raise_error
      end
    end
  end
end
