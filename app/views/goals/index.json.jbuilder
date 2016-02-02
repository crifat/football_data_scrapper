json.array!(@goals) do |goal|
  json.extract! goal, :id, :player_id, :player_name, :assist_id, :match_id
  json.url goal_url(goal, format: :json)
end
