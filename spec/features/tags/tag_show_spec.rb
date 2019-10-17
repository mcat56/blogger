require 'rails_helper'

describe 'user links from article show page' do
  it 'displays the name of the tag' do
    article = Article.create!(title: "New Title", body: "New Body")
    tag = article.tags.create!(name: "Name")

    visit article_path(article)

    click_link 'Name'

    expect(current_path).to eq(tag_path(tag))
    expect(page).to have_content('Name')

  end
end
