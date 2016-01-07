require "rails_helper"

RSpec.feature "Users can delete notes" do
  before do
    FactoryGirl.create(:note, title: "a title")
    visit "/"
  end
  scenario "after clicking delete" do
    click_link "destroy_note1"
    expect(page).to have_content "Note was successfully destroyed."
  end
end