require 'spec_helper'

describe ListGithubRepositoriesUsecase do

  fake(:repository_db) { Github::Repository }

  let(:user) { User.new(:nickname => "bob") }

  subject { described_class.new(user, repository_db) }

  it "gets git repositories from the storage" do
    subject.execute
    repository_db.should have_received.for_user("bob")
  end

  it "assigns returned repositories" do
    repositories = [1,2,3]
    stub(repository_db).for_user("bob") { repositories }
    subject.execute
    subject.repositories.should == repositories
  end

end
