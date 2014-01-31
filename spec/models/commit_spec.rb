require 'spec_helper'

describe Commit do 
  
  describe "Commit" do
    let(:sample_json_file) { IO.read(File.join(Rails.root, 'spec','sample_payload.json'))  }
    let(:parsed_commits) { JSON.parse(sample_json_file)["commits"] }

    describe "initialize method" do
      let(:commit) { Commit.new(parsed_commits.first) }

      it "requires one parameter" do
        expect { Commit.new }.to raise_error(ArgumentError)
      end

      it "creates a new instance" do
        commit.should_not be_nil
      end

      it "properly assigns id and url variables" do
        commit.id.should_not be_nil
        commit.url.should_not be_nil

        commit.id.should == "c441029cf673f84c8b7db52d0a5944ee5c52ff89"
        commit.url.should == "https://github.com/octokitty/testing/commit/c441029cf673f84c8b7db52d0a5944ee5c52ff89"
      end
    end

  end

end