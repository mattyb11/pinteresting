json.array!(@players) do |player|
  json.extract! player, :id, :player, :position, :overall_ranking, :positional_ranking
  json.url player_url(player, format: :json)
end
