require 'spec_helper'

describe Github::PullRequest do
  fake(:connection) { Github::Connection }

  let(:pull_request)    { fake( :base => fake(:sha => base_sha), :head => fake(:sha => target_sha)) }
  let(:repository_slug) { "x8/lint" }
  let(:pull_request_id) { 10 }
  let(:base_sha)        { "6d15d9441e3cdd2315f883756f92e19538f0cdab" }
  let(:target_sha)      { "113c4f41f7bc8f34ec75d47c8c4d59a29baedb59" }

  before do
    stub(connection).get_pull_request(repository_slug, pull_request_id) { pull_request }
  end

  subject { described_class.new(repository_slug, pull_request_id, connection) }

  it "have access to repository_slug" do
    subject.repository_slug.should == repository_slug
  end

  it "have access to pull_request_id" do
    subject.pull_request_id.should == pull_request_id
  end

  it "returns base sha of pull request" do
    subject.base_sha.should == base_sha
  end

  it "returns target / head sha of pull request" do
    subject.target_sha.should == target_sha
  end

end
