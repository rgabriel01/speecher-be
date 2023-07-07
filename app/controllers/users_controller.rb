class UsersController < ApplicationController
  protect_from_forgery except: [:index]

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
end
