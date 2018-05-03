require 'spec_helper'

RSpec.describe ReportsController, :type => :controller do

  before (:example) do
    @report = FactoryBot.create(:report)
    @report2 = FactoryBot.create(:great_report)
    @report3 = FactoryBot.build(:avg_report)
  end

  context "index" do
    it 'should return json of all saved reports' do
      get :index
      puts "#{@response.parsed_body()}"
      assert_response :success
      expect(@response.parsed_body).to include(@report.to_json)
      expect(@response.parsed_body).to include(@report2.to_json)
      expect(@response.parsed_body).not_to include(@report3.to_json)
    end
  end

end
