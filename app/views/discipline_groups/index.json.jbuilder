json.array!(@discipline_groups) do |discipline_group|
  json.extract! discipline_group, :name, :weeks_by_plan, :belongs_to
  json.url discipline_group_url(discipline_group, format: :json)
end
