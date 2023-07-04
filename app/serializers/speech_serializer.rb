class SpeechSerializer
  include JSONAPI::Serializer
  attributes  :id,
              :title,
              :body

  attribute :speech_date do |speech|
    # speech.date.strftime('%Y %b %d')
    speech.date
  end

  attribute :created_at do |speech|
    # speech.created_at.strftime('%m-%d-%y %I:%M%p')
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
