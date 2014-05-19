class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :lessons_list]
  before_filter :not_authenticated
  before_filter :for_segments_operator

  # GET /groups
  # GET /groups.json
  def index
    @year=StudyYear.find(params[:study_year_id])
    @search = @year.groups.includes(:faculty).includes(:department).includes(:plans).search(params[:q])
    @groups=@search.result(:distinct => true)
  end

  def lessons_list
    @discipline_groups = @group.discipline_groups
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @year=StudyYear.find(params[:study_year_id])
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    group_params.permit!
    @year=StudyYear.find(params[:study_year_id])
    @group = @year.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to study_year_groups_path, notice: 'Группа успешно создана.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    group_params.permit!
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to study_year_groups_path, notice: 'Информация о группе успешно изменена.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @year=StudyYear.find(params[:study_year_id])
      @group = @year.groups.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params[:group]
    end
end
