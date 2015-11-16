require 'spec_helper'

describe Blabbr do
  it 'has a version number' do
    expect(Blabbr::VERSION).not_to be nil
  end

  describe ".reset" do
    before :each do
      Blabbr.configure do |config|
        config.client_id = 12345
      end
    end

    it "resets the config" do
      Blabbr.reset
      config = Blabbr.config
      expect(config.client_id).to eq(nil)
    end
  end

  describe "#configure" do
    before do
      Blabbr.configure do |config|
        config.client_id = 12345
        config.client_secret = 67890
        config.host = "http://localhost:3003"
      end
    end

    it "sets the client_id correctly" do
      expect(Blabbr.config.client_id).to eq(12345)
    end

    it "sets the client_secret correctly" do
      expect(Blabbr.config.client_secret).to eq(67890)
    end

    it "sets the host correctly" do
      expect(Blabbr.config.host).to eq("http://localhost:3003")
    end

    after :each do
      Blabbr.reset
    end
  end
end
