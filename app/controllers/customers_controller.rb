class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.where(user_id: current_user.id)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer_id: @customer.id)
    @order_line_items = OrderLineItem.where(order_id: @orders.ids)
    
    p @orders
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    params.permit!
    @customer = Customer.new(params[:customer])
    @customer.user_id = current_user.id
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    params.permit!
    respond_to do |format|
      if @customer.update(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @orders = Order.where(customer_id: @customer.id)
    if @orders.present?
      flash[:error] = 'Order is present under the customers name. Please delete the orders to delete the customer.' 
      respond_to do |format|
        format.html { redirect_to customers_url}
        format.json { head :no_content }
      end
    @incomes = Income.where(customer_id: @customer.id)
    elsif @incomes.present?
      flash[:error] = 'Income is present under the customers name. Please delete the incomes to delete the customer.' 
      respond_to do |format|
        format.html { redirect_to customers_url}
        format.json { head :no_content }
      end
    else
      @customer.destroy
      respond_to do |format|
        format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.fetch(:customer, {})
    end
end
