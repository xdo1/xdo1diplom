class DisciplineGroupsController < ApplicationController
  before_action :set_discipline_group, only: [:show, :edit, :update, :destroy]

  # GET /discipline_groups
  # GET /discipline_groups.json
  def index
    @discipline_groups = DisciplineGroup.all
  end

  # GET /discipline_groups/1
  # GET /discipline_groups/1.json
  def show
  end

  # GET /discipline_groups/new
  def new
    @discipline_group = DisciplineGroup.new
  end

  # GET /discipline_groups/1/edit
  def edit
  end

  # POST /discipline_groups
  # POST /discipline_groups.json
  def create
    @discipline_group = DisciplineGroup.new(discipline_group_params)

    respond_to do |format|
      if @discipline_group.save
        format.html { redirect_to @discipline_group, notice: 'Discipline group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discipline_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @discipline_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discipline_groups/1
  # PATCH/PUT /discipline_groups/1.json
  def update
    respond_to do |format|
      if @discipline_group.update(discipline_group_params)
        format.html { redirect_to @discipline_group, notice: 'Discipline group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @discipline_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discipline_groups/1
  # DELETE /discipline_groups/1.json
  def destroy
    @discipline_group.destroy
    respond_to do |format|
      format.html { redirect_to discipline_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline_group
      @discipline_group = DisciplineGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_group_params
      params.require(:discipline_group).permit(:name, :weeks_by_plan, :belongs_to)
    end
end
