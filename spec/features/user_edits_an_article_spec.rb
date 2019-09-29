require 'rails_helper'

describe 'user edits an article' do
  describe 'they link from show page' do
    describe 'they edit the title and or body' do
      it 'displays the changes' do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")
        article_2 = Article.create!(title: "Title 2", body: "Body 2")

        visit article_path(article_1)
        click_link "Edit"

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]", with: "New Body!"
        click_on "Submit Changes"

        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
      end
    end
  end
end
