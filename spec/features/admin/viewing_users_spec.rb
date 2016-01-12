require "rails_helper"

RSpec.feature "Admin can view all users in a table" do
  let!(:user) { FactoryGirl.create(:user)}

  before do
    login_as(FactoryGirl.create(:user, :admin) )
    visit "/admin/users"
  end

  scenario "shows list of all registered users" do
    expect(page).to have_content user.email
  end

  scenario "show details of given user", js: true do
    click_link "show_user#{user.id}"
    expect(page).to have_content "#{user.email} details"
  end
end