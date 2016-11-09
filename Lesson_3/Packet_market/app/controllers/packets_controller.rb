class PacketsController < ApplicationController
  before_action :current_packet, only: [:show, :edit, :update, :destroy]

  def index
  	@packets = Packet.all
  end

  def show
  end

  def new
  	@packet = Packet.new
  end

  def create 
    @packet = Packet.new(packet_params)
    if @packet.save
    	redirect_to @packet
    else
      render :new
    end  	
  end	

  def edit
  end

  def update
    @packet.update_attributes(packet_params)
    if @packet.errors.empty?
    	redirect_to @packet
    else
      render :edit
    end  	
  end	

  def destroy
    @packet.delete
    redirect_to packets_path
  end	

  private

  def packet_params
    params.require(:packet).permit(:name, :price)
  end	

  def current_packet
    @packet = Packet.where(id: params[:id]).first
  end	
end