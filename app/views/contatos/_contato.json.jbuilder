json.extract! contato, :id, :name, :email, :phone, :message, :created_at, :updated_at
json.url contato_url(contato, format: :json)
