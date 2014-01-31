require 'spec_helper'

describe Lint::RubocopRunner do
  fake(:config_store)
  fake(:delta)      { Rugged::Diff::Delta }
  fake(:patch)      { Rugged::Diff::Patch }
  fake(:repository) { Rugged::Repository }

  let(:file_inspector) { fake() }

  before do
    mock(patch).delta     { delta }
    mock(delta).new_file  { { :path => "lib/path.rb" } }
    mock(repository).path { "/home/lint/repository/.git/" }
  end

  subject { described_class.new(repository, patch) }

  it "returns full path of patch" do
    subject.full_path.should == Pathname.new("/home/lint/repository/lib/path.rb")
  end

  describe "inspector" do
    let(:offence)  { fake() }
    let(:offences) { [offence] }

    it "runs inspector on file" do
      mock(subject).inspector { file_inspector }
      mock(file_inspector).inspect_file(subject.full_path, subject.config) { offences }

      subject.offences.should == offences
    end
  end

end
