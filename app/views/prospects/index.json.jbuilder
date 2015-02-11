json.array!(@prospects) do |prospect|
  json.extract! prospect, :id, :player, :position, :overall_ranking, :positional_ranking, :college, :notes
  json.url prospect_url(prospect, format: :json)
end
