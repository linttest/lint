require 'spec_helper'

describe AuthenticateWithGithubUsecase do

  fake(:db, :find_github_user => nil) { Db }
  fake_class(Devise, :friendly_token => "secret")

  let(:auth) { OpenStruct.new(
    :provider => "github",
    :uid      => "abc123",
    :info     => OpenStruct.new(
                  :email => "bob@example.com",
                  :name  =>  "bob",
                  :image => "http://img.com/bob"
                 )
  ) }

  subject { described_class.new(db, auth) }

  describe "when user is not registered" do
    it "creates a new user" do
      subject.execute
      db.should have_received.make_github_user(
        :provider => "github",
        :uid      => "abc123",
        :email    => "bob@example.com",
        :password => "secret",
        :name     => "bob",
        :avatar_url => "http://img.com/bob"
      )
    end
  end

  describe "when user is already registered" do
    let(:user) { User.new }

    before { stub(db).find_github_user("abc123") { user } }

    it "returns the user" do
      subject.execute
      subject.user.should == user
    end

    it "does not create the user" do
      subject.execute
      db.should_not have_received.make_github_user(any_args)
    end
  end

end
