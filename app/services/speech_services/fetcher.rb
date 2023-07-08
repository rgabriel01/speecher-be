class SpeechServices::Fetcher
  def initialize(
    show_active: true,
    author_id: nil,
    body: nil,
    date_range: nil,
    tags: nil
  )
    @show_active = show_active
    @author_id = author_id
    @body = body
    @date_range = date_range
    @tags = tags
  end

  def self.call(
    show_active: true,
    author_id: nil,
    body: nil,
    date_range: nil,
    tags: nil
  )
    new(
      show_active: show_active,
      author_id: author_id,
      body: body,
      date_range: date_range,
      tags: tags
    ).call
  end

  def call
    query = Speech
      .includes(:user)
      .where(deleted: !@show_active)

    query = query.where(user_id: @author_id) if @author_id.present?
    query = query.where("body LIKE ?", "%#{@body}%") if @body.present?
    query = query.where('date BETWEEN ? AND ?', @date_range.first, @date_range.last) if @date_range.present?

    (@tags || []).each do |tag|
      query = query.where("tags LIKE ?", "%#{tag}%")
    end

    query
  end
end
