module ApplicationHelper
  def check_user_sign_in
    if current_user
      link_to 'Log out', destroy_user_session_path, method: :delete
		end
	end

	def option_for_income_status
		Income.income_statuses.keys.map {|e| [e.humanize, e]}
	end

	def option_for_expense_status
		Expense.expense_statuses.keys.map {|e| [e.humanize, e]}
	end

end