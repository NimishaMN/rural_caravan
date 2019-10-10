class BillingsController < ApplicationController
  # require "integration"
  #before_action :set_billing, only: [:show, :edit, :update, :destroy]

  # GET /billings
  # GET /billings.json
  def index
    @billings = Billing.where(user_id: current_user.id)
  end

  # GET /billings/1
  # GET /billings/1.json
  def show
    @gateway = "https://www.instamojo.com/ruralcaravan"
    @sequence = Subscription.last
    @merchantTxnId = Date.today.to_s(:number)+ pad_sequence(@sequence.id)
    @return_url = 'http://www.egramvyapar.com/billings' if Rails.env.production?
  end

  # GET /billings/new
  def new
    @billing = Billing.new
  end

  # GET /billings/1/edit
  def edit
  end

  # POST /billings
  # POST /billings.json
  def create
    @billing = Billing.new(billing_params)
    @billing.user_id = current_user.id
    respond_to do |format|
      if @billing.save
        format.html { redirect_to @billing, notice: 'Billing was successfully created.' }
        format.json { render :show, status: :created, location: @billing }
      else
        format.html { render :new }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billings/1
  # PATCH/PUT /billings/1.json
  def update
    respond_to do |format|
      if @billing.update(billing_params)
        format.html { redirect_to @billing, notice: 'Billing was successfully updated.' }
        format.json { render :show, status: :ok, location: @billing }
      else
        format.html { render :edit }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billings/1
  # DELETE /billings/1.json
  def destroy
    @billing.destroy
    respond_to do |format|
      format.html { redirect_to billings_url, notice: 'Billing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upgrade
    amount = params[:button].to_i
    if amount == 500 
      validity = 1.month
    elsif amount == 1400
      validity = 3.month
    elsif amount == 5000
      validity = 1.year
    end
    p amount
    p validity

    error = []
    # user = #get user
    request_json = {
    "email" => current_user.email,
    "buyer_name" => current_user.email ,
    "phone" => "9890060986" ,
    "amount" => amount
    }
    intergration_object = Integration.new()
    begin
      payload = Instamojo::InstaPayload.new(request_json)
      payload_hash = payload.get_payload #change the name of def in instapayload
      response = intergration_object.payment_request(request_json)
    rescue Exception => e
      error << e.message
    end

    # @subscription = Subscription.new(
    #                     :user_id => current_user.id,
    #                     :amount => amount,
    #                     :validity => validity)
    # format.html { redirect_to(:action => :show , :id=> @subscription)}
        
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing
      @billing = Billing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_params
      params.fetch(:billing, {})
    end

    def pad_sequence(seq)
      if seq < 10
        "00"+seq.to_s
      elsif seq >= 10 and seq < 100
        "0"+ seq.to_s
      else
        seq.to_s
      end
    end
end
