json.array!(@lessons) do |lesson|
  json.extract! lesson, :type, :hours, :subject_id, :discipline_group_id
  json.url lesson_url(lesson, format: :json)
end
