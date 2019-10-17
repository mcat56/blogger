require 'rails_helper'

describe 'user can delete a tag' do
  describe 'user links from tag show page' do
    it 'displays all tags without the deleted tag' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      tag_1 = article_1.tags.create!(name: "ruby")
      tag_2 = article_1.tags.create!(name: "tech")
      tag_3 = article_1.tags.create!(name: "python")

      visit tag_path(tag_3)

      click_link 'Delete'

      expect(current_path).to eq(tags_path)

      expect(page).to have_content("ruby")
      expect(page).to have_content("tech")
      expect(page).to_not have_content("python")

    end
  end
end
