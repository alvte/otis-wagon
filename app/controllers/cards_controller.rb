class CardsController < ApplicationController
  before_action :find, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      @cards = results.map {|result| result.searchable}
    else
      @cards = Card.all
    end

     #client = OpenAI::Client.new
     #chaptgpt_response = client.chat(parameters: {
     # model: "gpt-3.5-turbo",
     # messages: [{ role: "user", content: "Give me a simple recipe in 10 words'."}]
     #})
     #@content = chaptgpt_response["choices"][0]["message"]["content"]

    #The code above is to launch in ChatGPT - to move in the Chat and implement there
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
