require 'httparty'
require 'open-uri'

class SearchController < ApplicationController
  # allows for auth. bypass for local development
  skip_before_filter :verify_authenticity_token

  def index
  end

  def results
    api_response = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=9447015102421242&q=#{request.POST['job_title']}&l=#{request.POST['job_location']}&sort=date&radius=&st=&jt=&start=&limit=25&fromage=30&filter=&latlong=&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2&format=json").parsed_response
    @all_jobs = api_response['results']
    @job_title = request.POST['job_title']
    @job_location = request.POST['job_location']
  end
end
