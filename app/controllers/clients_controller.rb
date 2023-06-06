class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clients, only: [:edit, :update, :destroy]

  def index  
    if params[:search] && !params[:search].empty?
      @clients = Client.search_all(params[:search])
    else
      @clients = Client.all 
    end
  end

  def new
    @client = Client.new
    @users = User.all
  end

  def edit
    @users = User.all
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: 'clients was successfully updated.'
    else
      render :new
    end
  end

  def create
    @client = Client.new(client_params)
    if @client.save!
      redirect_to clients_path, notice:  'Client was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: 'client was successfully destroyed.'
  end

private
  def set_clients
    @client = Client.find(params[:id])
  end
  def client_params
     params.require(:client).permit(:username, :lastname, :Phone, :Mail, :Comment, :Actif, :user_id)
  end
end

