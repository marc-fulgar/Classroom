class ClassSubjectsController < ApplicationController
  before_action :set_class_subject, only: [:show, :edit, :update, :destroy]

  # GET /class_subjects
  # GET /class_subjects.json
  def index
    @class_subjects = ClassSubject.all
  end

  # GET /class_subjects/1
  # GET /class_subjects/1.json
  def show
  end

  # GET /class_subjects/new
  def new
    @class_subject = ClassSubject.new
  end

  # GET /class_subjects/1/edit
  def edit
  end

  # POST /class_subjects
  # POST /class_subjects.json
  def create
    @class_subject = ClassSubject.new(class_subject_params)

    respond_to do |format|
      if @class_subject.save
        format.html { redirect_to @class_subject, notice: 'Class subject was successfully created.' }
        format.json { render :show, status: :created, location: @class_subject }
      else
        format.html { render :new }
        format.json { render json: @class_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_subjects/1
  # PATCH/PUT /class_subjects/1.json
  def update
    respond_to do |format|
      if @class_subject.update(class_subject_params)
        format.html { redirect_to @class_subject, notice: 'Class subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_subject }
      else
        format.html { render :edit }
        format.json { render json: @class_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_subjects/1
  # DELETE /class_subjects/1.json
  def destroy
    @class_subject.destroy
    respond_to do |format|
      format.html { redirect_to class_subjects_url, notice: 'Class subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_subject
      @class_subject = ClassSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_subject_params
      params.fetch(:class_subject, {})
    end
end
