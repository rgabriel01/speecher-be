class SpeechServices::Fetcher
  def initialize(show_active: true)
    @show_active = show_active
  end

  def self.call(show_active: true)
    new(show_active: show_active).call
  end

  def call
    Speech
      .includes(:user)
      .where(deleted: !@show_active)
  end
end
