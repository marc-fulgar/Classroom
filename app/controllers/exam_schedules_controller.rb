class ExamSchedulesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_exam_schedule, only: [:show, :edit, :update, :destroy, :exam_index]
  before_action :set_subject, only: [:new, :edit]

  # GET /exam_schedules
  # GET /exam_schedules.json
  def index
    @exam_schedules = ExamSchedule.all
  end

  # GET /exam_schedules/1
  # GET /exam_schedules/1.json
  def show
    @comment = @exam_schedule.comments.new
  end

  # GET /exam_schedules/new
  def new
    @exam_schedule = ExamSchedule.new
  end
  
  def exam_index
    @exams = @exam_schedule.exams.paginate(page: params[:page], per_page: 10).includes(student: :block_class)
  end

  # GET /exam_schedules/1/edit
  def edit
  end

  # POST /exam_schedules
  # POST /exam_schedules.json
  def create
    @exam_schedule = ExamSchedule.new(exam_schedule_params)

    respond_to do |format|
      if @exam_schedule.save
        format.html { redirect_to @exam_schedule, notice: 'Exam schedule was successfully created.' }
        format.json { render :show, status: :created, location: @exam_schedule }
      else
        format.html { render :new }
        format.json { render json: @exam_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_schedules/1
  # PATCH/PUT /exam_schedules/1.json
  def update
    respond_to do |format|
      if @exam_schedule.update(exam_schedule_params)
        format.html { redirect_to @exam_schedule, notice: 'Exam schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_schedule }
      else
        format.html { render :edit }
        format.json { render json: @exam_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_schedules/1
  # DELETE /exam_schedules/1.json
  def destroy
    @exam_schedule.destroy
    respond_to do |format|
      format.html { redirect_to exam_schedules_url, notice: 'Exam schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_exam_schedule
    @exam_schedule = ExamSchedule.find(params[:id])
  end
  
  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def exam_schedule_params
    params.fetch(:exam_schedule, {}).permit(:title, :content, :remarks, :subject_id, :max_score, :date)
  end
end
