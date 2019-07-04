class DashboardController < ApplicationController
  def index
  	
  	@employees = Employee.all
  	@businesses = Business.all
  	@work_details = WorkDetail.all
  	@activity_details = ActivityDetail.all


  	@month = Date::MONTHNAMES
    # @months = Date.new(:created_at)
  	# @receivables = Income.all.group_by{ |i| i.created_at.beginning_of_month } #(:created_at, :amount).count
    # @receivables = Income.select("date_trunc('month', created_at) as month").group("month", :amount)
    @receivables = Income.group_by_month(:created_at).count
  	p @receivables
  	# @payables = Expense.all.group_by{ |i| i.created_at.beginning_of_month } #.group(:created_at, :amount).count
    # @payables = Expense.select("date_trunc('month', created_at) as month").group("month", :amount)
    @payables = Expense.group_by_month(:created_at).count

  	p @payables


    @male_employees = ActivityDetail.select("employees").where(created_at: '2019-04-05')
    @female_employees = Employee.where(gender: 'female')
  end
end
