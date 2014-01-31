require 'spec_helper'

describe ListGithubRepositoriesUsecase do

  fake(:github_adapter) { Github::Adapter }

  let(:user) { User.new(:nickname => "bob") }

  subject { described_class.new(user, github_adapter) }

  it "gets git repositories from the storage" do
    subject.execute
    github_adapter.should have_received.get_user_repositories("bob")
  end

  it "assigns returned repositories" do
    repositories = [1,2,3]
    stub(github_adapter).get_user_repositories("bob") { repositories }
    subject.execute
    subject.repositories.should == repositories
  end

end
