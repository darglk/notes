require "rails_helper"

RSpec.feature "admin can edit user data" do
  let!(:user) { FactoryGirl.create(:user)}
  let(:useradmin) { FactoryGirl.create(:user, :admin)}
  before do
    login_as(useradmin)
    visit "/admin/users"
  end

  scenario "admin can updated user data", js: true do
    click_link "edit_user#{user.id}"
    check('Is admin')
    click_button "Update User"
    within "#user#{user.id}"do
      expect(page).to have_content "yes"
    end
  end

  scenario "admin can't uncheck is admin checkbox if its about him ", js: true do
    click_link "edit_user#{useradmin.id}"
    expect(page).to have_field("Is admin",disabled: true)
  end
end