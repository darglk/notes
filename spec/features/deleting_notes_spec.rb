require "rails_helper"

RSpec.feature "Users can delete notes" do
  let!(:user) { FactoryGirl.create(:user)}
  let!(:note) {FactoryGirl.create(:note, title: "a title", user_id: user.id)}
  before do
    login_as(user)

    visit "/"
  end
  scenario "after clicking delete", js: true do
    click_link "destroy_note#{note.id}"
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_content "a title"
  end
end