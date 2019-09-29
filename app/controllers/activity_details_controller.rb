class ActivityDetailsController < ApplicationController
  before_action :set_activity_detail, only: [:show, :edit, :update, :destroy]


  # GET /activity_details
  # GET /activity_details.json
  def index
    @activity_details = ActivityDetail.where(user_id: current_user.id)
  end

  # GET /activity_details/1
  # GET /activity_details/1.json
  def show
    @activity_detail = ActivityDetail.find(params[:id])
    @team_size = @activity_detail.employee_detail.compact.reject(&''.method(:==))
    p @team_size.length
    @emp = Employee.find(@team_size)

    respond_to do |format|
      format.html
      format.json {render :json => @employee}
    end
  end

  # GET /activity_details/new
  def new
    @activity_detail = ActivityDetail.new_activity
    
    @employess = Employee.all
  end

  # GET /activity_details/1/edit
  def edit
      @activity_detail = ActivityDetail.find(params[:id])
      @employess = Employee.all
  end

  # POST /activity_details
  # POST /activity_details.json
  def create
    params.permit!
    p params[:"start_date(1i)"]
    @activity_detail = ActivityDetail.new(params[:activity_detail])
    @activity_detail.status = 0
    @activity_detail.user_id = current_user.id
    respond_to do |format|
      if @activity_detail.save
        format.html { redirect_to @activity_detail, notice: 'Activity detail was successfully created.' }
        format.json { render :show, status: :created, location: @activity_detail }
      else
        format.html { render :new }
        format.json { render json: @activity_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_details/1
  # PATCH/PUT /activity_details/1.json
  def update
    params.permit!
    respond_to do |format|
      if @activity_detail.update(params[:activity_detail])
        format.html { redirect_to @activity_detail, notice: 'Activity detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_detail }
      else
        format.html { render :edit }
        format.json { render json: @activity_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_details/1
  # DELETE /activity_details/1.json
  def destroy
    @activity_detail.destroy
    respond_to do |format|
      format.html { redirect_to activity_details_url, notice: 'Activity detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def status
    params.permit!
    @activity_detail = ActivityDetail.find(params[:activity_detail][:id])
    @activity_detail.update_attributes!(end_date: Time.now,status: 1)
    redirect_to activity_details_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_detail
      @activity_detail = ActivityDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_detail_params
      params.fetch(:activity_detail, {})
    end
end
