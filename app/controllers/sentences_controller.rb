class SentencesController < ApplicationController
  def index
    @sentences = Sentence.all.order(created_at: :desc)
  end

  def edit
    @sentence = Sentence.find(params[:id])
  end

  def update
    @sentence = Sentence.find(params[:id])
    if @sentence.update(sentence_params)
      redirect_to root_path, notice: '文章を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def sentence_params
    params.require(:sentence).permit(:content)
  end
end
