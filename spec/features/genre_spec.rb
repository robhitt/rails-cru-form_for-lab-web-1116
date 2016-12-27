require 'rails_helper'

describe 'form' do
  it 'shows a new form that submits content and redirects and prints out params' do
    visit new_genre_path

    fill_in 'genre[name]', with: "My genre name"

    click_on "Create Genre"

    expect(page).to have_content("My genre name")
  end

  it 'shows a new form that submits content and redirects and prints out params' do
    @genre = Genre.create(name: "My Genre")

    visit edit_genre_path(@genre)

    fill_in 'genre[name]', with: "My edit"

    click_on "Update Genre"

    expect(page).to have_content("My edit")
  end
end
