class Integration
	extend Instamojo::ApiHelper

  def self.host
    "#{Integration.domain}"
  end
  
  def self.domain
    Rails.env.production? ?  "": "https://www.instamojo.com/api/1.1/"
  end

  def headers
    header = {"X-Api-Key" => "8fb2f2cfa390f91a2521b96180f0b61a" , "X-Auth-key" => "8fb2f2cfa390f91a2521b96180f0b61a"}
  end

  def payment_request(method = "payment-requests/", body)
    begin
	    self.class.api_post_login("#{Integration.host}"+ method.to_s, body, headers)
    rescue Exception => e
  	  ap e.message
    end
  end

end
