class SpeechServices::Creator
  def initialize(speech_params)
    @speech_params = speech_params
  end

  def self.call(speech_params)
    new(speech_params).call
  end

  def call
    speech = Speech.new(@speech_params)
    success = speech.save
    data = success ? SpeechSerializer.new(speech).serializable_hash[:data] : {}

    [
      success,
      data,
      speech.errors.full_messages
    ]
  end
end
