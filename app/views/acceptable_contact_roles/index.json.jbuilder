json.array!(@acceptable_contact_roles) do |acceptable_contact_role|
  json.extract! acceptable_contact_role, :id, :role
  json.url acceptable_contact_role_url(acceptable_contact_role, format: :json)
end
