class Integration
	# extend Instamojo::ApiHelper

  def self.host
    "#{Integration.domain}"
  end
  
  def self.domain
    Rails.env.production? ?  "": "https://www.instamojo.com/api/1.1/"
  end

  def headers
    header = {"X-Api-Key" => "" , "X-Auth-key" => ""}
  end

  def payment_request(method = "payment-requests/", body)
    begin
	    self.class.api_post_login("#{Integration.host}"+ method.to_s, body, headers)
    rescue Exception => e
  	  ap e.message
    end
  end

end
