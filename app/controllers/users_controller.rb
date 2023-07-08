class UsersController < ApplicationController
  protect_from_forgery except: [:index, :authenticate]

  def index
    data = UserServices::Fetcher.call

    respond_to do |format|
      format.json do
        render json: {
          ok: true,
          data: UserSerializer
            .new(data)
            .serializable_hash[:data]
        }
      end
    end
  end

  def authenticate
    data = UserServices::Authenticator
      .call(email: auth_params[:email])

    respond_to do |format|
      format.json do
        render json: {
          ok: true,
          data: UserSerializer
            .new(data)
            .serializable_hash[:data]
        }
      end
    end
  end

  private

  def auth_params
    params
      .permit(:email)
  end
end
