json.array!(@gists) do |gist|
  json.extract! gist, :id, :snippet, :lang, :description, :date
  json.url gist_url(gist, format: :json)
end
