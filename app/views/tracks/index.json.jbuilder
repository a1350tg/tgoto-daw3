json.array!(@tracks) do |track|
  json.extract! track, :id, :name, :instrument, :score, :project_id, :user_id
  json.url track_url(track, format: :json)
end
