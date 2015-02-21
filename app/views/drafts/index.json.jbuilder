json.array!(@drafts) do |draft|
  json.extract! draft, :id, :owner
  json.url draft_url(draft, format: :json)
end
