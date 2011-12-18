require 'spec_helper'

describe CommonController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'contact_us'" do
    it "returns http success" do
      get 'contact_us'
      response.should be_success
    end
  end

  describe "GET 'terms_privacy'" do
    it "returns http success" do
      get 'terms_privacy'
      response.should be_success
    end
  end

  describe "GET 'faq'" do
    it "returns http success" do
      get 'faq'
      response.should be_success
    end
  end

  describe "GET 'share'" do
    it "returns http success" do
      get 'share'
      response.should be_success
    end
  end

end
