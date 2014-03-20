class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_filter :not_authenticated
  before_filter :for_dictionaries_operator, :except => [:get_plan_list]
  before_filter :for_segments_operator, :only => [:get_plan_list]

  # GET /plans
  # GET /plans.json
  def index
    @search = Plan.includes(:study_years).includes(:speciality).search(params[:q])
    @plans=@search.result(:distinct => true)
  end

  def get_plan_list
    q="%#{params[:q]}%"
    render json: Plan.where("numer like ?", q).select('id, numer as name').all.to_json(only: [:name, :id])
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    plan_params.permit!
    params[:plan][:study_year_ids] ||= []
    @plan = Plan.new(plan_params)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to plans_path, notice: 'План успешно создан.' }
        format.json { render action: 'show', status: :created, location: @plan }
      else
        format.html { render action: 'new' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    plan_params.permit!
    params[:plan][:study_year_ids] ||= []
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to plans_path, notice: 'План успешно изменен.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params[:plan]
    end
end
