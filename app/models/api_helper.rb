module Instamojo
  module ApiHelper
	  def api_post(url , header, body)
	  	begin
	  		response = RestClient.post(url, header , body)
	  	rescue Exception => e
		  end
	  end
  end
end