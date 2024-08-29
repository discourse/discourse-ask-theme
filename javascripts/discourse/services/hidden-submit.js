import { action } from "@ember/object";
import { next } from "@ember/runloop";
import Service, { service } from "@ember/service";
import Composer from "discourse/models/composer";
import I18n from "discourse-i18n";

export default class HiddenSubmit extends Service {
  @service composer;
  @service dialog;

  inputValue = "";

  @action
  focusInput() {
    this.composer.destroyDraft();
    this.composer.close();
    next(() => {
      document.getElementById("custom-homepage-input").focus();
    });
  }

  @action
  async submitToBot() {
    this.composer.destroyDraft();
    this.composer.close();

    if (this.inputValue.length < 10) {
      this.dialog.alert({
        message: I18n.t(themePrefix("input_length")),
        didConfirm: () => this.focusInput(),
        didCancel: () => this.focusInput(),
      });
    }

    // this is a total hack, the composer is hidden on the homepage with CSS
    await this.composer.open({
      action: Composer.PRIVATE_MESSAGE,
      draftKey: "private_message_ai",
      recipients: "gpt-4o",
      topicTitle: I18n.t("discourse_ai.ai_bot.default_pm_prefix"),
      topicBody: this.inputValue,
      archetypeId: "private_message",
      disableDrafts: true,
    });

    try {
      await this.composer.save();
    } catch (error) {
      // eslint-disable-next-line no-console
      console.error("Failed to submit message:", error);
    }
  }
}
