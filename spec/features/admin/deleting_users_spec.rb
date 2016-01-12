require "rails_helper"

RSpec.feature "Admin can delete users" do
  let!(:user) { FactoryGirl.create(:user)}
  let!(:useradmin) { FactoryGirl.create(:user, :admin)}
  before do
    login_as(useradmin)
    visit "/admin/users"
  end

  scenario "successfully deleletes an user", js: true do
    click_link "destroy_user#{user.id}"
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_content user.email
  end

  scenario "admin cannot delete himself", js: true do
    expect(page).not_to have_link("destroy_user#{useradmin.id}")
  end
end