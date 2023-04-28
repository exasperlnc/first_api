class Api::V2::BooksController < ApplicationController
  before_save { |book| book.popularity = caluculate_popularity }
  def index
    render json: Book.all
  end

  private
  def caluculate_popularity
    if number_sold > 5
      'high'
    else
      'low'
    end
  end
end