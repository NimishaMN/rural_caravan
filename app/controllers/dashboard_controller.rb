class DashboardController < ApplicationController
  def index
  	# @activity = Activity.find_by_date(Time.now.to_date)
  	# p "=================="
  	# p @activity
  	@employees = Employee.all
  end
end
