module ApplicationHelper
  def check_user_sign_in
    if current_user
      link_to 'Log out', destroy_user_session_path, method: :delete
		end
	end
end