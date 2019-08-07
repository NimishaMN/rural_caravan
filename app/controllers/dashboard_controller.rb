class DashboardController < ApplicationController
  def index
  	
  	@employees = Employee.all
  	@businesses = Business.all
  	@work_details = WorkDetail.all
  	@activity_details = ActivityDetail.all
    @orders = Order.all
    @order_status = [['open', Order.where(status: 0).size], ['completed', Order.where(status: 1).size]]
    
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
