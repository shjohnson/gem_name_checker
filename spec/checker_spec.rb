require 'spec_helper'
require './lib/checker'


describe Checker do

	subject { Checker.new("test_gem") }

	describe "#rubygems_search" do

		it "calls HTTParty right" do
			response = double("Response", body: '[{"name": "test_gem"}]')
			HTTParty.should_receive(:get).and_return(response)
			subject.rubygems_search
		end
	end

	describe "#available?" do

		it "returns true if rubygems search is available" do
			subject.stub(rubygems_search: [])
			subject.available?.should eq true
		end

		it "returns false if rubygems search is not available" do
			subject.stub(rubygems_search: [{name: "test_gem"}])
			subject.available?.should eq false
		end

	end

end