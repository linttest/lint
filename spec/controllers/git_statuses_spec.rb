require 'spec_helper'
require 'json'

describe GitStatusesController do
  describe "post process_commit" do
    let(:payload_json) { IO.read(File.join(Rails.root, 'spec','sample_payload.json')) }

    before do
      post :process_commit, payload: payload_json 
    end

    it "posts requests with 200" do
      response.should be_success
    end

  end


end