require "rails_helper"

RSpec.feature "Users can view notes" do
  let!(:user) { FactoryGirl.create(:user)}
  let!(:note) { FactoryGirl.create(:note, title: "title", user: user)}

  before do
    login_as(user)
    visit "/"
  end

  scenario "User clicks on show button", js: true do
    click_link "show_note#{note.id}"
    expect(page).to have_content note.title
  end
end