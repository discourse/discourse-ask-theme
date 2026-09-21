# frozen_string_literal: true

RSpec.describe "Anonymous preview of AI conversations", type: :system do
  fab!(:user) do
    Fabricate(:user, username: "john", password: "supersecurepassword", refresh_auto_groups: true)
  end
  fab!(:group)
  fab!(:llm_model)

  let(:login_form) { PageObjects::Pages::Login.new }
  let(:quick_link_question) { "How do I make a custom badge?" }

  before do
    upload_theme_or_component
    SiteSetting.discourse_ai_enabled = true
    SiteSetting.ai_bot_enabled_llms = llm_model.id.to_s
    SiteSetting.ai_bot_enabled = true
    DiscourseAi::AiBot::SiteSettingsExtension.enable_or_disable_ai_bots
    SiteSetting.ai_bot_allowed_groups = "#{group.id}|#{Group::AUTO_GROUPS[:anonymous_users]}"
    SiteSetting.default_homepage = "ai-conversations"
    SiteSetting.enable_local_logins_via_code = false
    EmailToken.confirm(Fabricate(:email_token, user: user).token)
    group.add(user)
  end

  it "keeps a quick link question and asks anonymous visitors to log in" do
    visit "/"
    find(".ai-question-button", text: quick_link_question).click

    expect(login_form).to be_open

    login_form.fill(username: "john", password: "supersecurepassword").click_login

    expect(page).to have_field("ai-bot-conversations-input", with: quick_link_question)
  end
end
