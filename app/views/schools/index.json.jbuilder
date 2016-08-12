json.array!(@schools) do |school|
  json.extract! school, :id, :name, :country, :state, :address
  json.url school_url(school, format: :json)
end
