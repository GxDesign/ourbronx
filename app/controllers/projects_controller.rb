class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  def add_resource
    @project = Project.find(params[:project].to_i)
    @user = User.find(params[:user].to_i)
    @resource = ProjectResource.new
    @resource.user = @user
    @resource.project = @project
    @resource.save
  end

  def add_mentor

    @project = Project.find(params[:project].to_i)
    @user = User.find(params[:user].to_i)
    @mentor = ProjectMentor.new
    @mentor.user = @user
    @mentor.project = @project
    @mentor.save 
  end

  def add_service
    @project = Project.find(params[:project].to_i)
    @user = User.find(params[:user].to_i)
    @service = ProjectService.new
    @service.user = @user
    @service.project = @project
    @service.save
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:content, :user_id, :image, :title, :summary, :mentorship_req, :services_req, :resources_req, :published, :approved)
    end
end
