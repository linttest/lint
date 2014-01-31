require 'spec_helper'

describe Lint::RubocopRunner do
  fake(:config_store)

  let(:file_inspector) { fake() }
  let(:content)        { "content" }

  subject { described_class.new(content) }

  it "returns full path of patch" do
    subject.full_path.should == subject.file.path
  end

  it "file shold have content given in constructor" do
    File.open(subject.full_path).read.should == content
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
