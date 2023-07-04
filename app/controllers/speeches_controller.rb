class SpeechesController < ApplicationController
  def index
    data = Speeches::Fetcher.process

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

  def create; end

  def update; end
end
