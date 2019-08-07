class DashboardController < ApplicationController
  def index
  	
  	@employees = Employee.all
  	@businesses = Business.all
  	@work_details = WorkDetail.all
  	@activity_details = ActivityDetail.all

    @receivables = Income.group_by_month(:income_date, format: "%b %Y").sum('amount')
  	@payables = Expense.group_by_month(:expense_date, format: "%b %Y").sum('amount')


    @employee = ActivityDetail.all.select { |m| m.employees.present? }
    p @employees
    @male_employees = ActivityDetail.select('employees').where(created_at: Time.now)
    p @male_employees
    @female_employees = Employee.where('gender=? OR gender=?', 'female', 'Female')
  end
end
