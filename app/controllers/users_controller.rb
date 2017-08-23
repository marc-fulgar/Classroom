class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end
  
  def dashboard
    @user = current_user
    
    if @user.type?'Student'
      @user_subjects = @user.block_class.subjects.includes(:lectures, :assignments, exam_schedules: :exams)
      @user_exams = Exam.where(student_id: @user.id)
      @user_lectures = []
      @user_subjects.each do |subject|
      	subject.lectures.each do |lecture|
      		 @user_lectures << lecture
      	end
      end
      @user_assignments = []
      @user_subjects.each do |subject|
      	subject.assignments.each do |assignment|
      		 @user_assignments << assignment
      	end
      end
      @user_exam_schedules = []
      @user_exams.each do |exam|
        @user_exam_schedules << exam.exam_schedule
      end
    
      @user_events = @user_exam_schedules + @user_assignments + @user_lectures
    end
    
    @users = User.all
    @teachers = Teacher.all
    @students = Student.all
    @subjects = Subject.all
    @block_class = BlockClass.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @user.type? 'Teacher'
      redirect_to "/teachers/#{@user.id}"
    elsif @user.type? 'Student'
      redirect_to "/students/#{@user.id}"
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if @user.type? 'Teacher'
      redirect_to "/teachers/#{@user.id}/edit"
    elsif @user.type? 'Student'
      redirect_to "/students/#{@user.id}/edit"
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
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
      params.fetch(:user, {})
    end
end
