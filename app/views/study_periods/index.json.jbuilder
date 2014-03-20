json.array!(@study_periods) do |study_period|
  json.extract! study_period, 
  json.url study_period_url(study_period, format: :json)
end
