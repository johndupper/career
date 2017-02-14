json.extract! job, :id, :title, :company, :location, :snippet, :date, :created_at, :updated_at
json.url job_url(job, format: :json)