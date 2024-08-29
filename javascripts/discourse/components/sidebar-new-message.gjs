import Component from "@glimmer/component";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import Composer from "discourse/models/composer";
import I18n from "discourse-i18n";

export default class SidebarNewMessage extends Component {
  @service composer;

  inputValue = "";

  @action
  async openComposer() {
    await this.composer.open({
      action: Composer.PRIVATE_MESSAGE,
      draftKey: "private_message_ai",
      recipients: "gpt-4o",
      topicTitle: I18n.t("discourse_ai.ai_bot.default_pm_prefix"),
      archetypeId: "private_message",
      disableDrafts: true,
    });
  }

  <template>
    <DButton
      @action={{this.openComposer}}
      @translatedLabel="New discussion"
      @icon="plus"
      class="ai-new-question-button btn-default"
    />
  </template>
}
