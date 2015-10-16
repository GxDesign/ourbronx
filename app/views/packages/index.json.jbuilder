json.array!(@packages) do |package|
  json.extract! package, :id, :title, :description, :notification_params, :status, :transaction_id, :purchased_at
  json.url package_url(package, format: :json)
end
