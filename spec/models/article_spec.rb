require 'rails_helper'

describe 'Artticle' do
  let!(:user) { create(:user) }

  context 'データが正しい場合' do
    specify '正常に処理されること' do
      article = Article.new(user: user, name: "title", description: "comment desdes")
      article.save
      expect(article.name).to eq "title"
    end
  end

  context 'データが正しくない場合' do
    specify 'バリデーションエラーが起きること' do
      article = Article.new()
      article.valid?
      expect(article.errors.messages[:name]).to include("can't be blank")
    end
  end
end
