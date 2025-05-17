class QuizzesController < ApplicationController
  def show
    @sentence = Sentence.order("RANDOM()").first
  end
end
