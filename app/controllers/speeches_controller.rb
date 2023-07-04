class SpeechesController < ApplicationController
  protect_from_forgery except: [:create]

  def index
    data = SpeechServices::Fetcher.call

    respond_to do |format|
      format.json do
        render json: {
          ok: true,
          data: SpeechSerializer
            .new(data)
            .serializable_hash[:data]
        }
      end
    end
  end

  def create
    result, data, error_messages = SpeechServices::Creator.call(create_params)

    respond_to do |format|
      format.json do
        render json: {
          ok: result,
          data: data,
          error_messages: error_messages
        }
      end
    end
  end

  def update; end

  private

  def create_params
    params
      .require(:speech)
      .permit(:title, :body, :date, :user_id)
  end
end
