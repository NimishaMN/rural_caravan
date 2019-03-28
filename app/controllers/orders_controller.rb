class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @order_line_items = @order.order_line_items
    @customer = @order.customer
  end

  # GET /orders/new
  def new
    @customers = Customer.all
    @order = Order.new_orders(params)
    @products = Product.all
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    params.permit!
    p current_user
    @order = Order.new(params[:order])
    @order.user_id = current_user.id
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
        format.js 
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        format.js {render layout: false}
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    params.permit!
    respond_to do |format|
      if @order.update(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_row
    @order_line_item = OrderLineItem.new
    @products = Product.all
    respond_to do |format|
      format.js
    end
  end
  def remove_line_item
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {})
    end
end
