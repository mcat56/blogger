require 'rails_helper'

describe 'user_sees_one_article' do
  describe 'they link from the articles index' do
    it "displays information for one article" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit 'articles/'

      click_link article.title

      expect page.to have_content(article.title)
      expect page.to have_content(article.body)

    end
  end
end
