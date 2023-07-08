class SpeechSerializer
  include JSONAPI::Serializer
  attributes  :id,
              :title,
              :body,
              :tags

  attribute :speech_date do |speech|
    speech.date
  end

  attribute :created_at do |speech|
    speech.created_at
  end

  attribute :author do |speech|
    user = speech.user
    {
      full_name: "#{user.last_name} #{user.first_name}",
      id: user.id
    }
  end
end
