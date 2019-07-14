class DashboardController < ApplicationController
  def index
  	
  	@employees = Employee.all
  	@businesses = Business.all
  	@work_details = WorkDetail.all
  	@activity_details = ActivityDetail.all


  	@month = Date::MONTHNAMES
    # @months = Date.new(:created_at)
    @income_month = Income.select("created_at").map{ |i|  Date::MONTHNAMES[i.created_at.month] }.uniq
    @expense_month = Expense.select("created_at").map{ |i|  Date::MONTHNAMES[i.created_at.month] }.uniq
  	@receivables = Income.group(:created_at).pluck("sum(amount)").uniq
  	p @receivables
  	@payables = Expense.group(:created_at).pluck("sum(amount)").uniq
  	p @payables


    @male_employees = ActivityDetail.select("employees").where(created_at: '2019-07-13')
    @female_employees = Employee.where(gender: 'female')
  end
end
