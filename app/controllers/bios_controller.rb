class BiosController < ApplicationController
  before_action :set_bio, only: [:show, :update, :edit, :destroy]

  def index
    @bios = current_user.bios
  end

  def show
  end

  def new
    @bio = Bio.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @bio = Bio.new(bio_params)
    @bio.user = current_user
    if @bio.save
      flash[:success] = "New Bio successfully added!"
      redirect_to bio_path(@bio)
    else
      flash[:alert] = "There was an error adding your trip. Please try agian."
      render partial: "form"
    end
  end

  def update
    if @bio.update(bio_params)
      flash[:success] = "Bio successfully updated!"
      redirect_to bio_path(@bio)
    else
      flash[:alert] = "There was an error editing your bio. Please try agian."
      render partial: "form"
    end
  end

  def destroy
    @bio.destroy
    flash[:success] = "Bio successfully deleted!"
    redirect_to bios_path
  end

  private
    def set_bio
      @bio = current_user.bio
    end

    def set_account
      current_user.bio
    end

    def bio_params
      params.require(:bio).permit(:avatar, :description)
    end

end
