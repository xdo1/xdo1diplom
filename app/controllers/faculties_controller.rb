class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]
  before_filter :not_authenticated
  before_filter :for_dictionaries_operator

  # GET /faculties
  # GET /faculties.json
  def index
    @search = Faculty.includes(:departments).search(params[:q])
    @faculties=@search.result(:distinct => true)
  end

  # GET /faculties/1
  # GET /faculties/1.json
  def show
  end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
  end

  # GET /faculties/1/edit
  def edit
  end

  # POST /faculties
  # POST /faculties.json
  def create
    faculty_params.permit!
    @faculty = Faculty.new(faculty_params)

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to faculties_path, notice: 'Факультет успешно создан.' }
        format.json { render action: 'show', status: :created, location: @faculty }
      else
        format.html { render action: 'new' }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1
  # PATCH/PUT /faculties/1.json
  def update
    faculty_params.permit!
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to faculties_path, notice: 'Информация о факультете успешно изменена.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  def destroy
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to faculties_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_params
      params[:faculty]
    end
end
