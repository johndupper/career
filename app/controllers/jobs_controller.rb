class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  # allows for auth. bypass for local development
  skip_before_filter :verify_authenticity_token

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      flash.now[:notice] = 'Job saved to your dashboard!'
    else
      flash.now[:alert] = 'Error while saving, try again?'
    end
    # respond_to do |format|
    #   if @job.save
    #     format.html { render :index, notice: 'Job was successfully created.' }
    #     format.json { render :show, status: :created, location: @job }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @job.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Removed 'require' from params
    def job_params
      params.permit(:title, :company, :location, :snippet, :date)
    end
end
