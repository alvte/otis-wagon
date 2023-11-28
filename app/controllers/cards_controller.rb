class CardsController < ApplicationController
  before_action :find, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @cards = Pg.Search.multisearch(params[:query])
    else
      @cards = Card.all
    end
  end

  # only for admin users
  def show; end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user
    if @card.save
      redirect_to card_path(@card)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @card.update(card_params)
  end

  def destroy
    @card.destroy
    redirect_to root_path status: :see_other
  end

  private

  def find
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :summary, :content, :additional_resources, photos: [])
  end
end
