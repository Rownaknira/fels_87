module WordsHelper
  def load_word
    @word = Word.find params[:id]
  end
end