json.extract! note, :id, :content, :completed, :customer_id, :user_id, :created_at, :updated_at
json.url note_url(note, format: :json)
