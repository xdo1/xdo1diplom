json.array!(@study_process_graphics) do |study_process_graphic|
  json.extract! study_process_graphic, 
  json.url study_process_graphic_url(study_process_graphic, format: :json)
end
