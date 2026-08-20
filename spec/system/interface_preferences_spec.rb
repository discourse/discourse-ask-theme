# frozen_string_literal: true

RSpec.describe "Interface preferences", type: :system do
  fab!(:current_user, :user)

  let(:interface_preferences) { PageObjects::Pages::UserPreferencesInterface.new }

  before do
    upload_theme_or_component
    sign_in(current_user)
  end

  it "shows the send shortcut preference while hiding the rest of the other settings group" do
    interface_preferences.visit(current_user)

    expect(page).to have_css(".control-group.other .pref-send-shortcut")
    expect(page).to have_no_css(".control-group.home")
  end
end
