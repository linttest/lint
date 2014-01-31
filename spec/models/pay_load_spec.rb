require 'spec_helper'

describe PayLoad do 
  
  describe "PayLoad" do
    let(:sample_json_file)  { IO.read(File.join(Rails.root, 'spec','sample_payload.json')) }
    let(:pay_load)          { PayLoad.new(sample_json_file) }

    describe "initialize method" do
      it "initializes four instance variables" do
        pay_load.hook_hash.should_not be_nil
        pay_load.repository_name.should_not be_nil
        pay_load.repository_url.should_not be_nil
        pay_load.sha.should_not be_nil
      end

      it "assigns proper values to repository name and url" do
        pay_load.repository_name.should == "testing"
        pay_load.repository_url.should == "https://github.com/octokitty/testing"
        pay_load.sha.should == "1481a2de7b2a7d02428ad93446ab166be7793fbb"
      end
    end

    describe "commits method" do
      it "returns array" do
        pay_load.commits.should be_an_instance_of Array
      end

      it "returns array that has 3 elements" do
        pay_load.commits.size.should == 3
      end

      it "returns array of Commit instances" do
        pay_load.commits.each do |element|
          element.should be_an_instance_of PayLoadCommit
        end
      end
    end

  end

end