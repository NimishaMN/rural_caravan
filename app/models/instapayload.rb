module Instamojo

  class InstaPayload

    def initialize(request_json)
    @user = request_json[:user]
    end

    def get_payload
    {
      "purpose" => "Subscription",
      "amount" => @user.amount,
      "buyer_name"=> @user.email,
      "email"=> @user.email,
      "phone"=> "9890060986",
      "redirect_url"=> "http://www.egramvyapar.com/billings",
      "send_email"=> true,
      "send_sms"=> true,
      "webhook"=> "http://www.egramvyapar.com/dashboard/index",
      "allow_repeated_payments"=> false
    }
    end
  end
end