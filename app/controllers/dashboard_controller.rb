class DashboardController < ApplicationController
  def index
  	
  	@employees = Employee.all
  	@businesses = Business.all
  	@work_details = WorkDetail.all
  	@activity_details = ActivityDetail.all


  	@month = Date::MONTHNAMES
    # @months = Date.new(:created_at)
  	@receivables = Income.group(:amount).order(:created_at).count
  	p @receivables
  	@payables = Expense.group(:amount).order(:created_at).count
  	p @payables


    @male_employees = Employee.where(gender: 'male')
    @female_employees = Employee.where(gender: 'female')
    p @male_employees
    p @female_employees
  end
end
