class DashboardController < ApplicationController
  def index
  	
  	@employees = Employee.all
  	@businesses = Business.all
  	@work_details = WorkDetail.all
  	@activity_details = ActivityDetail.all


  	@month = Date::MONTHNAMES
    # @months = Date.new(:created_at)
  	@receivables = Income.group(:created_at, :amount).count
  	p @receivables
  	@payables = Expense.group(:created_at, :amount).count
  	p @payables


    @male_employees = ActivityDetail.select("employees").where(created_at: '2019-04-05')
    @female_employees = Employee.where(gender: 'female')
  end
end
