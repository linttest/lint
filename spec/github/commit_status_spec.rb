require 'spec_helper'

describe Github::CommitStatus do
  let(:repository) { "x8/lint" }
  let(:commit)     { "c6f0787d57f9895a2d239551d3e97f2513da9ea8" }
  let(:state)      { nil }
  let(:connection) { fake(:create_status => "status_response", :statuses => "statuses") { Github::Connection } }

  subject { described_class.new(repository, commit, state) }

  before do
    stub(subject).connection { connection }
  end

  describe "github" do
    let(:state) { "success" }


    it "push state do github" do
      subject.push.should == "status_response"
    end

    it "get states from github" do
      subject.get.should == "statuses"
    end
  end

  describe "supported state" do
    let(:state) { "success" }

    it "should send status to github" do
      expect { subject.push }.not_to raise_error
    end
  end

  describe "unsupported state" do
    let(:state) { "unsupported" }

    it "should send status to github" do
      expect { subject.push }.to raise_error
    end
  end
end
