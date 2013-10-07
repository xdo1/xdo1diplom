class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :not_authenticated
  before_filter :for_admin, :except => [:change_role, :change_year]

  # GET /users
  # GET /users.json
  def index
    @search = User.search(params[:q])
    @users=@search.result(:distinct => true)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def change_role
    @user=User.find(current_user.id)
    @role=Role.find(params[:id])
    if @role && @user.roles.include?(@role)
      @user.current_role=params[:id]
      @user.save
      redirect_to root_path
    else
      redirect_to logout_path
    end
  end

  def change_year
    @user=User.find(current_user.id)
    @year=StudyYear.find(params[:id])
    if @year
      @user.current_year=@year.id
      @user.save
      redirect_to root_path
    else
      redirect_to  root_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    user_params.permit!
    params[:user][:role_ids] ||= []
    if user_params[:role_ids].size > 0
      user_params[:current_role]=user_params[:role_ids].first
    end
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user_params.permit!
    params[:user][:role_ids] ||= []
    user_params[:current_role]=user_params[:role_ids].first
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
end
