class SpeechesController < ApplicationController
  protect_from_forgery except: [:create, :update, :fetch_by_author]

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

  def update
    result, data, error_messages = SpeechServices::Updater.call(params[:id], update_params)

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

  def fetch_by_author
    data = SpeechServices::Fetcher.call(author_id: params[:author_id])

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

  private

  def create_params
    params
      .permit(:title, :body, :date, :user_id)
  end

  def update_params
    params
      .permit(:title, :body, :date)
  end
end
