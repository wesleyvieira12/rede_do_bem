json.extract! user, :id, :name, :city_id_id, :category_id_id, :kind, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
