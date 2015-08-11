class InformationToConnectsController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  def index
    @information = InformationToConnect.first
  end

  def new
    if InformationToConnect.first
      redirect_to information_to_connects_url, notice: 'В системе уже существуют данные для подключения!'
    else
      @information = InformationToConnect.new
    end

  end

  def create
    @information = InformationToConnect.new(information_params)

    if @information.save
      redirect_to @information, notice: 'Информация для подключения успешно добавлена в систему!'
    else
      render action: 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @information.update(information_params)
      redirect_to @information, notice: 'Информация успешно обновленна!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @information.destroy
    redirect_to information_to_connects_url
  end

  def set_information
    @information = InformationToConnect.find(params[:id])
  end

  def information_params
    params.require(:information_to_connect).permit(:client_id, :client_secret, :code, :access_token)
  end
end
