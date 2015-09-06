class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]


  def index
    stock ||= Stock.first
    if stock
      redirect_to stock_path(stock.id)
    else
      redirect_to new_stock_path
    end
  end

  def new
    @information_to_connect ||= InformationToConnect.first

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
    #Manager.start
    @members = Member.order(likes: :desc)

    #@members = Member.all

    # pretty_json = JSON.pretty_generate(json)
    #puts(pretty_json)
  end

  def edit
    @stock.is_valid=false
    flag = Manager.stop
    if flag
      if @stock.save
        @members = Member.order(likes: :desc).take(10)
        render 'show'
      else
        render 'show'
      end
    end
  end

  def update
  end

  def destroy
    Member.delete_all
    puts('Все участники удаленны')
    @stock.destroy
    puts('Акция удаленна')
    redirect_to stocks_path
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:start_date, :expiration_date, :expiration_time, :number_of_the_winners, :hashtag, :is_valid)
  end

end
