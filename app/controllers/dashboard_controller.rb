class DashboardController < ApplicationController
  def index
  	
  	@employees = Employee.all
  	@businesses = Business.all
  	@work_details = WorkDetail.all
  	@activity_details = ActivityDetail.all
  	@month = Date::MONTHNAMES
  	@receivables = Expense.where(expense_status: '0').group(:amount).count
  	p @receivables
	@payables = Expense.where(expense_status: '1').group(:amount).count
	p @payables
	# @profit = @receivables.amount.first - @payables.amount.first
	# p @profit
  end
end
