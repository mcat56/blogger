require 'rails_helper'

describe 'I can see all tags' do
  it 'I visit the tags index and see all tags' do
    article_1 = Article.create!(title: "Title 1", body: "Body 1")
    article_2 = Article.create!(title: "Title 2", body: "Body 2")
    article_3 = Article.create!(title: "Title 3", body: "Body 3")

    article_1.tags.create!(name: "ruby")
    article_1.tags.create!(name: "tech")
    article_1.tags.create!(name: "python")

    article_2.tags.create!(name: "ruby")
    article_2.tags.create!(name: "tech")
    article_2.tags.create!(name: "python")

    article_3.tags.create!(name: "ruby")
    article_3.tags.create!(name: "tech")
    article_3.tags.create!(name: "sql")
    article_3.tags.create!(name: "rails")

    visit tags_path

    expect(page).to have_link("ruby")
    expect(page).to have_link("tech")
    expect(page).to have_link("python")
    expect(page).to have_link("sql")
    expect(page).to have_link("rails")
  end
end
