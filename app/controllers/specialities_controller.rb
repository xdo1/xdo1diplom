class SpecialitiesController < ApplicationController
  before_action :set_speciality, only: [:show, :edit, :update, :destroy]
  before_filter :not_authenticated
  before_filter :for_dictionaries_operator

  # GET /specialities
  # GET /specialities.json
  def index
    @search = Speciality.search(params[:q])
    @specialities=@search.result(:distinct => true)
  end

  # GET /specialities/1
  # GET /specialities/1.json
  def show
  end

  # GET /specialities/new
  def new
    @speciality = Speciality.new
  end

  # GET /specialities/1/edit
  def edit
  end

  # POST /specialities
  # POST /specialities.json
  def create
    speciality_params.permit!
    @speciality = Speciality.new(speciality_params)

    respond_to do |format|
      if @speciality.save
        format.html { redirect_to specialities_path, notice: 'Специальность успешно создана.' }
        format.json { render action: 'show', status: :created, location: @speciality }
      else
        format.html { render action: 'new' }
        format.json { render json: @speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialities/1
  # PATCH/PUT /specialities/1.json
  def update
    speciality_params.permit!
    respond_to do |format|
      if @speciality.update(speciality_params)
        format.html { redirect_to specialities_path, notice: 'Информация о специальности успешно изменена .' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialities/1
  # DELETE /specialities/1.json
  def destroy
    @speciality.destroy
    respond_to do |format|
      format.html { redirect_to specialities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speciality
      @speciality = Speciality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def speciality_params
      params[:speciality]
    end
end
