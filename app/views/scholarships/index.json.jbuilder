json.array!(@scholarships) do |scholarship|
  json.extract! scholarship, :id
  json.url scholarship_url(scholarship, format: :json)
end
