class BlockClassesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_block_class, only: [:show, :edit, :update, :destroy]

  # GET /block_classes
  # GET /block_classes.json
  def index
    @block_classes = BlockClass.all.includes(:advisory)
  end

  # GET /block_classes/1
  # GET /block_classes/1.json
  def show
  end

  # GET /block_classes/new
  def new
    @block_class = BlockClass.new
    @advisories = Advisory.where(block_class_id: nil)
  end

  # GET /block_classes/1/edit
  def edit
    @advisories = Advisory.where(block_class_id: nil)
  end

  # POST /block_classes
  # POST /block_classes.json
  def create
    @block_class = BlockClass.new(block_class_params)

    respond_to do |format|
      if @block_class.save
        format.html { redirect_to @block_class, notice: 'Block class was successfully created.' }
        format.json { render :show, status: :created, location: @block_class }
      else
        format.html { render :new }
        format.json { render json: @block_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /block_classes/1
  # PATCH/PUT /block_classes/1.json
  def update
    respond_to do |format|
      if @block_class.update(block_class_params)
        format.html { redirect_to @block_class, notice: 'Block class was successfully updated.' }
        format.json { render :show, status: :ok, location: @block_class }
      else
        format.html { render :edit }
        format.json { render json: @block_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /block_classes/1
  # DELETE /block_classes/1.json
  def destroy
    @block_class.destroy
    respond_to do |format|
      format.html { redirect_to block_classes_url, notice: 'Block class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block_class
      @block_class = BlockClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_class_params
      params.fetch(:block_class, {}).permit(:name, :advisory_id)
    end
end
