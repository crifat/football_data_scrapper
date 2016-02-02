json.array!(@assists) do |assist|
  json.extract! assist, :id, :match_id, :player_id, :player_name
  json.url assist_url(assist, format: :json)
end
