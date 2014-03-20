json.array!(@practices) do |practice|
  json.extract! practice, 
  json.url practice_url(practice, format: :json)
end
