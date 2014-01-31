require 'spec_helper'

describe Github::Adapter do

  let(:connection) { fake(:repositories => [], :commit => fake(:files => [])) { Octokit::Client } }
  let(:commit)     { PayLoadCommit.new("repository_slug" => "X8/lint", "id" => "abcdef1234") }

  before { stub(subject).connection { connection } }

  it "publishes commit status" do
    status = Analyzer::Status.new(:success)
    subject.publish_commit_status(commit, status)
    connection.should have_received.create_status("X8/lint", "abcdef1234", :success)
  end

  it "returns user repositories" do
    subject.get_user_repositories("X8")
    connection.should have_received.repositories("X8")
  end

  it "returns files in commit" do
    subject.get_commit_files(commit)
    connection.should have_received.commit("X8/lint", "abcdef1234")
  end

end
