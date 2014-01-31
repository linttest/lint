require 'spec_helper'

describe CommitsController do
  describe "get show" do
    let (:commit) { Commit.create(sha: "dgfgfgsadas")}

    it "responds with 200" do
      get :show, id: commit.to_param
      response.should be_success
    end

    it "assigns instance variable" do
      get :show, id: commit.to_param
      assigns(:commit).should_not be_nil
    end
  end
end