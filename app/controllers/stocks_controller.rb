class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]


  def index
    if Stock.first
      redirect_to stocks_path(Stock.first)
    else
      redirect_to new_stock_path
    end
  end

  def new
    if Stock.first
      redirect_to stock_index_url, notice: 'Акция уже запущенна, для запуска новой Акции остановите текущую!'
    else
      @stock = Stock.new
    end
  end

  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      redirect_to @stock
    else
      render action: 'new'
    end
  end

  def show
    if @stock
      if @stock.is_valid == true
      end
    end
  end

  def edit
    @stock.is_valid=false
    if @stock.save
      render 'show'
    else
      render 'show'
    end
  end

  def update
  end

  def destroy
    @stock.destroy
    redirect_to stocks_path
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:start_date, :expiration_date, :expiration_time, :number_of_the_winners, :hashtag, :is_valid)
  end

end
