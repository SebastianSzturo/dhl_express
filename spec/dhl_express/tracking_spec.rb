require 'spec_helper'

describe DhlExpress::Tracking do
  describe "#initialize" do
    it "should not initialize without tracking number argument" do
      expect { DhlExpress::Tracking.new() }.to raise_error(ArgumentError)
    end

    it "should initialize a tracking object" do
      VCR.use_cassette 'working_tracking' do
        package = DhlExpress::Tracking.new("6476119576")
        expect(package).to be_kind_of(DhlExpress::Tracking)
      end
    end
  end

  describe "#origin" do
    it "should return a origin string" do
      VCR.use_cassette 'working_tracking' do
        package = DhlExpress::Tracking.new("6476119576")
        expect(package.origin).to be_kind_of(String)
      end
    end

    it "should return nil with empty tracking number" do
      VCR.use_cassette 'empty_tracking' do
        package = DhlExpress::Tracking.new("1234567")
        expect(package.origin).to be_nil
      end
    end
  end

  describe "#destination" do
    it "should return a destination string" do
      VCR.use_cassette 'working_tracking' do
        package = DhlExpress::Tracking.new("6476119576")
        expect(package.destination).to be_kind_of(String)
      end
    end

    it "should return nil with empty tracking number" do
      VCR.use_cassette 'empty_tracking' do
        package = DhlExpress::Tracking.new("1234567")
        expect(package.destination).to be_nil
      end
    end
  end

  describe "#status" do
    it "should return a status string" do
      VCR.use_cassette 'working_tracking' do
        package = DhlExpress::Tracking.new("6476119576")
        expect(package.status).to be_kind_of(String)
      end
    end

    it "should return nil with empty tracking number" do
      VCR.use_cassette 'empty_tracking' do
        package = DhlExpress::Tracking.new("1234567")
        expect(package.status).to be_nil
      end
    end
  end

  describe "#history" do
    it "should return a history array" do
      VCR.use_cassette 'working_tracking' do
        package = DhlExpress::Tracking.new("6476119576")
        expect(package.history).to be_kind_of(Array)
      end
    end

    it "should return nil with empty tracking number" do
      VCR.use_cassette 'empty_tracking' do
        package = DhlExpress::Tracking.new("1234567")
        expect(package.history).to be_nil
      end
    end
  end

end
