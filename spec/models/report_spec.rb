require 'spec_helper'

RSpec.describe Report, :type => :model do

  before (:example) do
    @report = FactoryBot.build(:report)
  end

  context "validation" do
    it 'should validate' do
      expect(@report).to be_valid
    end

    it 'should have reports with ratings between 1 & 5' do
      @report.rating = 0
      expect(@report).to be_invalid
      @report.rating = 7
      expect(@report).to be_invalid
    end

    it 'should have a valid reporter email' do
      @report.reporter = "bademail@asdfasdf"
      expect(@report).to be_invalid
    end

    it 'should not be empty' do
      @report = Report.new()
      expect(@report).to be_invalid
    end

    it 'should not have a large reporter email' do
      @report.reporter = "a" * 255 + "@test.com"
      expect(@report).to be_invalid
    end

    it 'should not have a large description' do
      @report.description = "a" * 301
      expect(@report).to be_invalid
    end

  end

end
