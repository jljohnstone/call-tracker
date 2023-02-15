json.extract! phone_call, :id, :customer_id, :user_id, :created_at, :updated_at
json.url phone_call_url(phone_call, format: :json)
