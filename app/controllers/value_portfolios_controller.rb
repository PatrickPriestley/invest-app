class ValuePortfoliosController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :new]
  before_action :correct_user,   only: [:show, :destroy]

  def show
    @value_portfolio = ValuePortfolio.find(params[:id])
  end

  def new
    @value_portfolio = ValuePortfolio.new
  end

  def create
    @value_portfolio = current_user.value_portfolios.build(value_portfolio_params)
    if @value_portfolio.save
      flash[:success] = "Value Portfolio created!"
      redirect_to @value_portfolio
    else
      render 'new'
    end
  end

  def get_quote
    @value_portfolio = YahooFinance::Client.new
    data = @value_portfolio.quotes([:stock_symbol], [:last_trade_price], { raw: false } )
    data[0].last_trade_price
  end

  private
  def value_portfolio_params
    params.require(:value_portfolio).permit(:portfolio_name, :initial_investment, :investment_increase, :share_price, :commission_paid, :date_of_trade, :stock_symbol)
  end

  def correct_user
      @user = current_user.value_portfolios.find_by(id: params[:id])
      redirect_to root_url if @user.nil?
  end
end
