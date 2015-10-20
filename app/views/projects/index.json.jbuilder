json.array!(@projects) do |project|
  json.extract! project, :id, :user_id, :title, :summary, :mentorship_req, :resources_req, :services_req, :published, :approved
  json.url project_url(project, format: :json)
end
