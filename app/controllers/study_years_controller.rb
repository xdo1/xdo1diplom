class StudyYearsController < ApplicationController
  before_action :set_study_year, only: [:show, :edit, :update, :destroy]
  before_filter :not_authenticated
  before_filter :for_dictionaries_operator

  # GET /study_years
  # GET /study_years.json
  def index
    @study_years = StudyYear.all
  end

  # GET /study_years/1
  # GET /study_years/1.json
  def show
  end

  # GET /study_years/new
  def new
    @study_year = StudyYear.new
  end

  # GET /study_years/1/edit
  def edit
  end

  # POST /study_years
  # POST /study_years.json
  def create
    study_year_params.permit!
    @study_year = StudyYear.new(study_year_params)

    respond_to do |format|
      if @study_year.save
        format.html { redirect_to study_years_path, notice: 'Учебный год успешно создан.' }
        format.json { render action: 'show', status: :created, location: @study_year }
      else
        format.html { render action: 'new' }
        format.json { render json: @study_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_years/1
  # PATCH/PUT /study_years/1.json
  def update
    study_year_params.permit!
    respond_to do |format|
      if @study_year.update(study_year_params)
        format.html { redirect_to study_years_path, notice: 'Учебный год успешно изменен.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @study_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_years/1
  # DELETE /study_years/1.json
  def destroy
    @study_year.destroy
    respond_to do |format|
      format.html { redirect_to study_years_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_year
      @study_year = StudyYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_year_params
      params[:study_year]
    end
end
