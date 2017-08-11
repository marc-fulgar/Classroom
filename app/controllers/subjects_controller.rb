class SubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all.paginate(page: params[:page], per_page: 10).includes(:teacher)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    @block_classes = BlockClass.all
  end

  # GET /subjects/1/edit
  def edit
    @block_classes = BlockClass.all - @subject.block_classes
  end
  
  def lectures
    @subject = Subject.find(params[:id])
    @lectures = @subject.lectures
  end
  
  def assignments
    @subject = Subject.find(params[:id])
    @assignments = @subject.assignments
  end
  
  def exam_schedules
    @subject = Subject.find(params[:id])
    @exam_schedules = @subject.exam_schedules
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
    
    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def destroy_block_class
    @block_class = BlockClass.find(params[:block_class_id])
    redirect_to subject_path
    @subject.block_classes.destroy(@block_class)
    flash[:notice] = "Block #{@block_class.name} succesfully removed."
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subject_params
    params.fetch(:subject, {}).permit(:name, :teacher_id, block_class_ids: [], old_block_class_ids: [])
  end
end
