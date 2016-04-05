class TickersController < ApplicationController

  def index
    if params[:query].present?
      @tickers = Ticker.search(params[:query], suggest: true)
    else
      @tickers = []
    end
  end

  def typeahead
    q = params[:query]
    render json: Ticker.where('ticker LIKE ?', "%#{q}%")
  end
end
