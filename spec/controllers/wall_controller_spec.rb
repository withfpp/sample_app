require 'spec_helper'

describe WallController do

  describe "GET 'write'" do
    it "returns http success" do
      get 'write'
      response.should be_success
    end
  end

  describe "GET 'posts'" do
    it "returns http success" do
      get 'posts'
      response.should be_success
    end
  end

end
