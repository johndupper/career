class SearchController < ApplicationController
  # allows for auth. bypass for local development
  skip_before_filter :verify_authenticity_token

  def index
  end

  def results
    @job_title = request.POST['job_title']
    @job_location = request.POST['job_location']
  end
end
