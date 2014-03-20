class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_filter :not_authenticated
  before_filter :for_dictionaries_operator, :except => [:get_subject_list]

  # GET /subjects
  # GET /subjects.json
  def index
    @search = Subject.search(params[:q])
    @subjects=@search.result(:distinct => true)
  end

  def get_subject_list
    q="%#{params[:q]}%"
    render json: Subject.where("name like ?", q).all.to_json(only: [:name, :id])
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    subject_params.permit!
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_path, notice: 'Предмет успешно создан.' }
        format.json { render action: 'show', status: :created, location: @subject }
      else
        format.html { render action: 'new' }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    subject_params.permit!
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subjects_path, notice: 'Информация о предмете успешно изменена.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params[:subject]
    end
end
