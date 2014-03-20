class StudyPeriodsController < ApplicationController
  before_action :set_study_period, only: [:show, :edit, :update, :destroy]
  before_action :set_year
  # GET /study_periods
  # GET /study_periods.json
  def index
    @study_periods = @year.study_periods
    @search = @study_periods.search(params[:q])
    @groups=@search.result(:distinct => true)
  end

  # GET /study_periods/1
  # GET /study_periods/1.json
  def show
  end

  # GET /study_periods/new
  def new
    @study_period = StudyPeriod.new
  end

  # GET /study_periods/1/edit
  def edit
  end

  # POST /study_periods
  # POST /study_periods.json
  def create
    study_period_params.permit!
    @study_period = StudyPeriod.new(study_period_params)
    @study_period.study_year = @year

    respond_to do |format|
      if @study_period.save
        format.html { redirect_to study_year_study_periods_path(current_user.current_year), notice: 'Учебный отрезок успешно создан.' }
        format.json { render action: 'show', status: :created, location: @study_period }
      else
        format.html { render action: 'new' }
        format.json { render json: @study_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_periods/1
  # PATCH/PUT /study_periods/1.json
  def update
    study_period_params.permit!
    @study_period.study_year = @year
    respond_to do |format|
      if @study_period.update(study_period_params)
        format.html { redirect_to study_year_study_periods_path(current_user.current_year), notice: 'Учебный отрезок успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @study_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_periods/1
  # DELETE /study_periods/1.json
  def destroy
    @study_period.destroy
    respond_to do |format|
      format.html { redirect_to study_periods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_period
      @study_period = StudyPeriod.find(params[:id])
    end

    def set_year
      @year = StudyYear.find(params[:study_year_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_period_params
      params[:study_period]
    end
end
