require 'rails_helper'

describe 'user edits an article' do
  describe 'they link from a show page' do
    describe 'they fill in an edit field and submit' do
      it 'displays the updated information on a show' do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")
        article_2 = Article.create!(title: "Title 2", body: "Body 2")

        visit article_path(article_1)
        click_link "Edit"

        fill_in "article[title]", with: "Different Title"
        fill_in "article[body]", with: "Different Body"
        click_on "Update Article"

        expect(current_path).to eq(article_path(article_1))
        expect(page).to have_content("Different Title")
        expect(page).to_not have_content("Title 1")
        expect(page).to have_content("Different Body")
        expect(page).to_not have_content("Body 1")
        # expect(page).to have_content("Article Different Title Updated!")
      end
    end
  end
end
