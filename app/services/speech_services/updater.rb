class SpeechServices::Updater
  def initialize(id, params)
    @params = params
    @id = id
  end

  def self.call(id, params)
    new(id, params).call
  end

  def call
    return [false, {}, ['Speech not found']] if speech.blank?

    success = speech.update(@params)
    data = success ? SpeechSerializer.new(speech).serializable_hash[:data] : {}

    [
      success,
      data,
      []
    ]
  end

  private

  def speech
    @speech ||= Speech.find_by(id: @id)
  end
end
