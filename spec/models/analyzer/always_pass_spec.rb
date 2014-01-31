require 'spec_helper'

describe Analyzer::AlwaysPass do

  it "always passes" do
    result = subject.execute("some content")
    result.status.should == :success
  end

end
