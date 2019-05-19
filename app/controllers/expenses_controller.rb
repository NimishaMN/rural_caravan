class ExpensesController < ApplicationController
  before_action :set_expense, only: [:destroy, :update]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id])
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @vendor = Vendor.all
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
    @vendor = Vendor.all
    p @vendor
  end

  # POST /expenses
  # POST /expenses.json
  def create
    params.permit!
    p params
    @expense = Expense.new(params[:expense])
    @expense.user_id = current_user.id
    respond_to do |format|
      if @expense.save!
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    params.permit!
    @vendor = Vendor.all
    p @expense
    respond_to do |format|
      if @expense.update(params[:expense])
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        @vendor = Vendor.all
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.fetch(:expense, {})
    end
end
