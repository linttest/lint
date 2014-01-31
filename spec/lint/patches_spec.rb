require 'spec_helper'

describe Lint::Patches do
  fake(:repository) { Rugged::Repository }
  fake(:delta)      { Rugged::Diff::Delta }
  fake(:patch)      { Rugged::Diff::Patch }

  let(:repository_path) { "." }
  let(:base_sha)        { "6d15d9441e3cdd2315f883756f92e19538f0cdab" }
  let(:target_sha)      { "113c4f41f7bc8f34ec75d47c8c4d59a29baedb59" }
  let(:pull_request)    { fake(:pull_request, :base_sha => base_sha, :target_sha => target_sha) }
  let(:patches)         { [patch] }
  let(:new_file)        { { :path => "lib/lint/patches.rb"} }

  subject { described_class.new(repository_path, pull_request) }

  before do
    mock(Rugged::Repository).new(repository_path) { repository }
    mock(repository).diff(target_sha, base_sha) { patches }
  end

  it "returns patches for given commits" do
    subject.patches.should == patches
  end

  describe "#files" do
    before do
      mock(patch).delta    { delta }
      mock(delta).new_file { new_file }
    end

    it "returns list of files to test" do
      subject.files.should include("lib/lint/patches.rb")
    end

    describe "ruby files" do
      let(:new_file) { { :path => "app/assets/frontend.coffee"} }

      it "returns only ruby files" do
        subject.files.should be_empty
      end
    end
  end
end
