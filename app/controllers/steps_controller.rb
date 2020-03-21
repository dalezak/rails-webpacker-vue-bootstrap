class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :index, Step
    @search = params.fetch(:search, nil)
    @offset = params.fetch(:offset, 0).to_i
    @limit = [params.fetch(:limit, 12).to_i, 48].min
    query = Step.for_search(@search)
    @steps = query.limit(@limit).offset(@offset).order(ordinal: :asc).all
    @steps_count = query.count(:all)
    respond_to do |format|
      format.html { render layout: true }
      format.json { }
    end
  end

  def show
    authorize! :show, @step
  end

  def new
    authorize! :new, Step
    @step = Step.new
  end

  def edit
    authorize! :edit, @step
  end

  def create
    authorize! :create, Step
    @step = Step.new(step_params)
    respond_to do |format|
      if @step.save
        format.html { redirect_to @step, notice: 'Step was successfully created.' }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @step
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to @step, notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @step
    @step.destroy
    respond_to do |format|
      format.html { redirect_to steps_url, notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:type, :name, :description, :ordinal, :deleted_at)
  end
  
end
