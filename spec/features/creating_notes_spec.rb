require "rails_helper"
include CarrierWave::Test::Matchers
RSpec.feature "Users can create notes" do
  let!(:user) { FactoryGirl.create(:user)}
  let!(:next_user) { FactoryGirl.create(:user)}
    before do
      login_as(user)
      visit "/"
      click_link "New Note"
    end
    scenario "with valid attributes (other users can't see note)", js: true do
      fill_in "Title", with: "Some Note"
      fill_in "Description", with: "Some long long long descirption"

      attach_file "File name", Rails.root.join("spec/fixtures/kotel.jpg"), match: :first
      click_link "Add Attachment"

      click_button "Create Note"
      expect(page).to have_content "Some Note"
      visit "/"

      click_link "Show"
      within "#gallery" do
        expect(page).to have_css("img[src*='kotel']")
      end

      logout(:next_user)
      login_as(next_user)
      visit "/"
      expect(page).not_to have_content "Some Note"
    end

  scenario "with invalid attributes", js: true do
      fill_in "Title", with: ""
      fill_in "Description", with: "Too ."
      click_button "Create Note"

      expect(page).to have_content "can't be blank"
      expect(page).to have_content "too short"

  end
end