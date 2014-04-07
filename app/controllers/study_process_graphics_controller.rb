class StudyProcessGraphicsController < ApplicationController
  before_action :set_study_process_graphic, only: [:show, :edit, :update, :destroy]
  before_action :set_year
  before_action :set_group, only: [:new_with_group, :edit_with_group]

  # GET /study_process_graphics
  # GET /study_process_graphics.json
  def index
    @study_process_graphics = @year.study_process_graphics
    @search = @study_process_graphics.search(params[:q])
    @groups=@search.result(:distinct => true)
  end

  # GET /study_process_graphics/1
  # GET /study_process_graphics/1.json
  def show
  end

  # GET /study_process_graphics/new
  def new_with_group
    @study_process_graphic = StudyProcessGraphic.new
  end

  # GET /study_process_graphics/1/edit
  def edit_with_group
  end

  # POST /study_process_graphics
  # POST /study_process_graphics.json
  def create
    study_process_graphic_params.permit!
    @study_process_graphic = StudyProcessGraphic.new(study_process_graphic_params)
    @study_process_graphic.study_year = @year

    respond_to do |format|
      if @study_process_graphic.save
        StudyPeriod.create!(group: Group.find(study_process_graphic_params[:group_id]), study_process_graphic: @study_process_graphic, study_year: @year)
        format.html { redirect_to study_year_study_process_graphics_path(current_user.current_year), notice: 'График учебного процесса успешно создан.' }
        format.json { render action: 'show', status: :created, location: @study_process_graphic }
      else
        format.html { render action: 'new' }
        format.json { render json: @study_process_graphic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_process_graphics/1
  # PATCH/PUT /study_process_graphics/1.json
  def update
    study_process_graphic_params.permit!
    @study_process_graphic.study_year = @year

    respond_to do |format|
      if @study_process_graphic.update(study_process_graphic_params)
        format.html { redirect_to study_year_study_process_graphics_path(current_user.current_year), notice: 'График учебного процесса успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @study_process_graphic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_process_graphics/1
  # DELETE /study_process_graphics/1.json
  def destroy
    @study_process_graphic.destroy
    respond_to do |format|
      format.html { redirect_to study_year_study_process_graphics_path(current_user.current_year) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_process_graphic
      @study_process_graphic = StudyProcessGraphic.find(params[:id])
    end

    def set_year
      @year = StudyYear.find(params[:study_year_id])
    end

    def set_group
      if params[:group_id]
        @group = Group.find(params[:group_id])
      end
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def study_process_graphic_params
      params[:study_process_graphic]
    end
end
