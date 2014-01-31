require 'spec_helper'

describe AnalyzeCodeChangeUsecase do

  let(:files)    { ["file content"] }
  let(:commit)   { Commit.new("id" => "abcdef12345") }
  let(:payload)  { PayLoad.new("repository" => { "name" => "lint", "url" => "http://github.com/X8/lint" }) }

  fake(:analyzer)       { Analyzer::AlwaysPass }
  fake(:github_adapter) { Github::Adapter }

  subject { described_class.new(payload, analyzer, github_adapter) }

  before do
    stub(payload).commits { [commit] }
    stub(github_adapter).get_commit_files(commit) { files }
  end

  it "runs code analyzer with file contents received with payload" do
    subject.execute
    analyzer.should have_received.execute(files)
  end

  it "publishes analysis results to github" do
    subject.execute
    github_adapter.should have_received.publish_commit_status(any_args)
  end

end
