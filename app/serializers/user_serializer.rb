class UserSerializer
  include JSONAPI::Serializer

  attributes  :id,
              :email

  attribute :full_name do |user|
    "#{user.last_name} #{user.first_name}"
  end
end
