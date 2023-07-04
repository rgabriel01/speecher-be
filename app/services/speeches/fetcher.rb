class Speeches::Fetcher
  def initialize(show_active: true)
    @show_active = show_active
  end

  def self.process(show_active: true)
    new(show_active: show_active).process
  end

  def process
    Speech
      .includes(:user)
      .where(deleted: !@show_active)
  end
end
