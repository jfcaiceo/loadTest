class User < ActiveResource::Base
  devise :database_authenticatable, :resource_authenticatable

  self.site = Rails.application.secrets[:api_url]
  self.include_format_in_path = false
  self.patch_updates = true

  schema do
    string :email, :encrypted_password
    integer :id
    timestamp :updated_at, :created_at
  end
end
