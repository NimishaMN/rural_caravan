class WorkDetailsController < ApplicationController
  before_action :set_work_detail, only: [:show, :edit, :update, :destroy]

  # GET /work_details
  # GET /work_details.json
  def index
    @work_details = WorkDetail.where(user_id: current_user.id)
  end

  # GET /work_details/1
  # GET /work_details/1.json
  def show
    @work_detail = WorkDetail.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :json => @work_detail}
    end
  end

  # GET /work_details/new
  def new
    @product = Product.where(user_id: current_user.id)
    @business = Business.find(params[:business_id])
    @products = Product.where(business_id: @business.id)
    @work_detail = WorkDetail.new
  end

  # GET /work_details/1/edit
  def edit
    @work_detail = WorkDetail.find(params[:id])
    @business = Business.find(@work_detail.business_id)
    p @business
    @products = Product.where(business_id: @business.id)
    
   end

  # POST /work_details
  # POST /work_details.json
  def create
    params.permit!
    @work_detail = WorkDetail.new(params[:work_detail])
    @work_detail.user_id = current_user.id
    @work_detail.business_id = params[:business_id]
    respond_to do |format|
      if @work_detail.save
        format.html { redirect_to business_path(@work_detail.business_id), notice: 'Work detail was successfully created.' }
        format.json { render :show, status: :created, location: @work_detail }
      else
        @business = Business.find(params[:business_id])
        @products = Product.where(business_id: @business.id)
        format.html { render :action => "new"  }
        format.json { render json: @work_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_details/1
  # PATCH/PUT /work_details/1.json
  def update
    params.permit!
    @business = Business.find(@work_detail.business_id)
    @products = Product.where(business_id: @business.id)

    @work_detail.business_id = params[:business_id]
    
    respond_to do |format|
      if @work_detail.update(work_detail_params)
        format.html { redirect_to business_path(@work_detail.business_id), notice: 'Work detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_detail }
      else
        format.html { render :edit }
        format.json { render json: @work_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_details/1
  # DELETE /work_details/1.json
  def destroy
    @work_detail.destroy
    respond_to do |format|
      format.html { redirect_to work_details_url, notice: 'Work detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_detail
      @work_detail = WorkDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_detail_params
      params.fetch(:work_detail, {})
    end
end
