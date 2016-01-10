require 'rails_helper'

RSpec.feature "Users can edit notes" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:note) {FactoryGirl.create(:note, :title => "an title", user: user)}
  before do
    login_as(user)
    visit "/"
  end

  scenario "Successfully note update", js: true do
    click_link "edit_note#{note.id}"
    fill_in "Title", with: "new title"
    fill_in "Description", with: "new long a very long descirption"
    click_button "Update Note"

    expect(page).to have_content "new title"
  end

  scenario "Unsucessfully note update", js: true do
    click_link "edit_note#{note.id}"
    fill_in "Title", with: ""
    fill_in "Description", with: "too short"
    click_button "Update Note"

    expect(page).to have_content "can't be blank"
    expect(page).to have_content "too short"
  end
end