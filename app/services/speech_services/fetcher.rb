class SpeechServices::Fetcher
  def initialize(show_active: true, author_id: nil)
    @show_active = show_active
    @author_id = author_id
  end

  def self.call(show_active: true, author_id: nil)
    new(show_active: show_active, author_id: author_id).call
  end

  def call
    query = Speech
      .includes(:user)
      .where(deleted: !@show_active)

    query = query.where(user_id: @author_id) if @author_id.present?
    query
  end
end
