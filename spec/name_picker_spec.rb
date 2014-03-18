require 'spec_helper'
require './lib/name_picker'

describe NamePicker do

  subject { NamePicker.new("test_gem") }

  describe "#response" do
    describe "when the name is free" do
      before do
        # We can make a new instance of Checker
        checker = Checker.new("test_gem")
        # And pretend that available? will always return true
        checker.stub(available?: true)
        # And then make sure subject.checker returns our special stubbed checker
        subject.stub(checker: checker)
      end
      it "returns a message telling you it is free" do
        subject.response.should eq "That name is available."
      end
    end
    describe "when the name is taken" do
      before do
        # Or we can make a completely fake object to pretend to be a checker.
        checker = double("Checker double", available?: false)
        subject.stub(checker: checker)
      end
      it "returns a message telling you it is taken" do
        # Pretend that Suggestor.alternatives_for always returns "t3st_g3m"
        Suggestor.stub(alternatives_for: "t3st_g3m")
        subject.response.should eq "That name is not available: why not try t3st_g3m"
      end
      it "asks the Suggestor for alternatives" do
        # Demand that something calls
        # Suggestor.alternatives_for("test_gem")
        # before the end of this test.
        Suggestor.should_receive(:alternatives_for).with("test_gem").and_return("t3st_g3m")
        subject.response
      end
    end
  end

end
