require 'rails_helper'

RSpec.feature "Users can edit notes" do
  before do
    FactoryGirl.create(:note, :title => "a title")
    visit "/"
  end

  scenario "Successfully note update" do
    click_link "edit_note1"
    fill_in "Title", with: "new title"
    fill_in "Description", with: "new long a very long descirption"
    click_button "Update Note"

    expect(page).to have_content "Note was successfully updated."
    expect(page).to have_content "new title"
  end

  scenario "Unsucessfully note update" do
    click_link "edit_note1"
    fill_in "Title", with: ""
    fill_in "Description", with: "too short"
    click_button "Update Note"

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description is too short"
  end
end