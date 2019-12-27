require "rails_helper"
RSpec.feature "Login", type: :feature do
      
  let!(:boss) {FactoryBot.create :user}
  let!(:guest) {FactoryBot.create :user, role: Settings.factories.users.role_fake_guest}
  let!(:admin) {FactoryBot.create :user, role: Settings.factories.users.role_fake_admin}
  
  before do
    visit login_path
  end
  
  feature "Login successfully" do
    scenario "role: guest" do
      fill_in "session[email]", with: guest.email
      fill_in "session[password]", with: Settings.default_password
      click_button "commit"
      expect(page).to have_current_path "#{root_path}en"
    end

    scenario "role: boss" do
      fill_in "session[email]", with: boss.email
      fill_in "session[password]", with: Settings.default_password
      click_button "commit"
      expect(page).to have_current_path "#{root_path}en"
    end
    
    scenario "role: boss" do
      fill_in "session[email]", with: admin.email
      fill_in "session[password]", with: Settings.default_password
      click_button "commit"
      expect(page).to have_current_path "#{root_path}en"
    end
  end

  feature "Invalid Input" do
    scenario "missing email" do
      fill_in "session[password]", with: Settings.default_password
      click_button "commit"
      expect(page).to have_text I18n.t("invalid_combination")
    end
    
    scenario "missing password" do
      fill_in "session[email]", with: guest.email
      click_button "commit"
      expect(page).to have_text I18n.t("invalid_combination")
    end

    scenario "missing both email and password" do
      click_button "commit"
      expect(page).to have_text I18n.t("invalid_combination")
    end
  end

  feature "login failed" do
    scenario "wrong email and password" do
      fill_in "session[email]", with: Settings.factories.users.fake_email
      fill_in "session[password]", with: Settings.factories.users.fake_password
      click_button "commit"
      expect(page).to have_text I18n.t("invalid_combination")
    end
  end
end
