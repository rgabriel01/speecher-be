class UserServices::Authenticator
  def initialize(email: nil)
    @email = email
  end

  def self.call(email: nil)
    new(email: email).call
  end

  def call
    User
      .where(active: true)
      .where(email: @email)
      .last
  end
end
