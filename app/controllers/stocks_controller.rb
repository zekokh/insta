class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def index
    if Stock.first
      @stock = Stock.first
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
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def information_params
    params.require(:stocks).permit(:start_date, :expiration_date, :expiration_time, :number_of_the_winners, :hashtag)
  end

end
