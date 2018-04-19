class ReportsController < ApplicationController

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      flash[:info] = 'Report receieved. Thanks for submitting.'
      redirect_to root_url
    else
      flash[:warn] = 'Invalid report data, please submit again.'
      render 'new'
    end
  end

  private

  def report_params
    params.require(:report).permit(:reporter, :address,
        :lat, :lng, :rating, :description)
  end

end
