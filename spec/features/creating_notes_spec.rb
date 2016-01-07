require "rails_helper"

RSpec.feature "Users can create notes" do
  let!(:user) { FactoryGirl.create(:user)}
  let!(:szmata) { FactoryGirl.create(:user)}
    before do
      login_as(user)
      visit "/"
      click_link "New Note"
    end
    scenario "with valid attributes (other users can't see note)" do
      fill_in "Title", with: "Some Note"
      fill_in "Description", with: "Some long long long descirption"
      click_button "Create Note"
      expect(page).to have_content "Note has been created."
      click_link "Back"
      expect(page).to have_content user.email
      logout(:user)
      login_as(szmata)
      visit "/"
      expect(page).not_to have_content "Some Note"
    end

  scenario "with invalid attributes" do
      fill_in "Title", with: ""
      fill_in "Description", with: "Too ."
      click_button "Create Note"

      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Description is too short"

  end
end