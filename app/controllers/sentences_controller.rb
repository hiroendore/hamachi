class SentencesController < ApplicationController
  def index
    @sentences = Sentence.all.order(created_at: :desc)
  end

  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    if @sentence.save
      redirect_to root_path, notice: '文章を作成しました。'
    else
      render :new, status: :unprocessable_entity
    end
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

  def destroy
    @sentence = Sentence.find(params[:id])
    @sentence.destroy
    redirect_to root_path, notice: '文章を削除しました。'
  end

  private

  def sentence_params
    params.require(:sentence).permit(:content)
  end
end
