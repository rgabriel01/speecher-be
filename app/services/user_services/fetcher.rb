class UserServices::Fetcher
  def initialize(show_active: true)
    @show_active = show_active
  end

  def self.call(show_active: true)
    new(show_active: show_active).call
  end

  def call
    User
      .where(active: @show_active)
  end
end
