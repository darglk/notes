require "rails_helper"

RSpec.feature "Users can view notes" do
  scenario "User clicks on show button" do
    pending
    visit "/"
    click_link "New Note"
    fill_in "Title", with: "title"
    fill_in "Description", with: "some long long long"
    click_button "Create Note"
    visit "/"
    click_link('show_note1')
    expect(page).to have_content "title"
  end
end