json.array!(@gists) do |gist|
  json.extract! gist, :id, :snippet, :lang, :description
  json.url gist_url(gist, format: :json)
end
