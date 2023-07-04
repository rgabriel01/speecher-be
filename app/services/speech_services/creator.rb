class SpeechServices::Creator
  def initialize(params)
    @params = params
  end

  def self.call(params)
    new(params).call
  end

  def call
    speech = Speech.new(@params)
    success = speech.save
    data = success ? SpeechSerializer.new(speech).serializable_hash[:data] : {}

    [
      success,
      data,
      speech.errors.full_messages
    ]
  end
end
