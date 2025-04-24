class SentencesController < ApplicationController
  def index
    @sentences = Sentence.all.order(created_at: :desc)
  end
end
