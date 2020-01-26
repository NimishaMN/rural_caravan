class DashboardController < ApplicationController
  def index
  	
  	@employees = Employee.where(user_id: current_user.id)
  	@businesses = Business.where(user_id: current_user.id)
  	@work_details = WorkDetail.where(user_id: current_user.id)
  	@activity_details = ActivityDetail.where(user_id: current_user.id)
    @orders = Order.where(user_id: current_user.id)
    @order_status = [['open', Order.where(status: 0,user_id: current_user.id).size], ['completed', Order.where(status: 1, user_id: current_user.id).size]]
    
    @incomes = Income.where(user_id: current_user.id)
    @expenses = Expense.where(user_id: current_user.id)
    @receivables = @incomes.group_by_month(:income_date, format: "%b %Y").sum('amount')
  	@payables = @expenses.group_by_month(:expense_date, format: "%b %Y").sum('amount')
    
    sum = 0

    @a = ActivityDetail.where("start_date = ?",Time.now.to_date)
    p "a  #{@a.inspect}"
    @a.each do |a|#ActivityDetail.where(created_at: Time.now).employee_detail
      @team_size = a.employee_detail.compact.reject(&''.method(:==))
      p "team_size #{@team_size}"
      @val = @team_size.uniq
      p " val #{@val}"
      sum += @team_size.length
      p "sum #{sum}"
    end
    emp = @employees.count
    p "emp #{emp}"
    @male_employees = emp - sum
    # @male_employees = ActivityDetail.select('employees').where(created_at: Time.now.to_date)
    p "male  #{@male_employees}"
    @female_employees = @employees.where('gender=? OR gender=?', 'female', 'Female')
  end
end
