class DashboardController < ApplicationController
  def index
  	
  	@employees = Employee.all
  	@businesses = Business.all
  	@work_details = WorkDetail.all
  	@activity_details = ActivityDetail.all
    @orders = Order.all
    @order_status = [['open', Order.where(status: 0).size], ['completed', Order.where(status: 1).size]]
    

    @receivables = Income.group_by_month(:income_date, format: "%b %Y").sum('amount')
  	@payables = Expense.group_by_month(:expense_date, format: "%b %Y").sum('amount')
sum = 0

    @a = ActivityDetail.where("start_date = ?",Time.now.to_date)
    @a.each do |a|#ActivityDetail.where(created_at: Time.now).employee_detail
      @team_size = a.employee_detail.compact.reject(&''.method(:==))
      @val = @team_size.uniq
      p @val
      p sum += @team_size.length
    end
    emp = Employee.all.count
    @male_employees = emp - sum
    # @male_employees = ActivityDetail.select('employees').where(created_at: Time.now.to_date)
    p @male_employees
    @female_employees = Employee.where('gender=? OR gender=?', 'female', 'Female')
  end
end
