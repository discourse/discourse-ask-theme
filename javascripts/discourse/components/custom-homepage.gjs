import Component from "@glimmer/component";
import { Input } from "@ember/component";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import bodyClass from "discourse/helpers/body-class";
import i18n from "discourse-common/helpers/i18n";
import HomepageButtons from "../components/homepage-buttons";

export default class CustomHomepage extends Component {
  @service hiddenSubmit;

  @action
  updateInputValue(event) {
    this.hiddenSubmit.inputValue = event.target.value;
  }

  @action
  handleKeyDown(event) {
    if (event.key === "Enter") {
      this.hiddenSubmit.submitToBot();
    }
  }

  <template>
    {{bodyClass "custom-homepage"}}
    <div class="custom-homepage__content-wrapper">
      <h1>{{i18n (themePrefix "title")}}</h1>
      <HomepageButtons />
      <div class="custom-homepage__input-wrapper">
        <Input
          {{didInsert this.hiddenSubmit.focusInput}}
          {{on "input" this.updateInputValue}}
          {{on "keydown" this.handleKeyDown}}
          @type="text"
          id="custom-homepage-input"
          placeholder={{i18n (themePrefix "input_placeholder")}}
          minlength="10"
        />
        <DButton
          @action={{this.hiddenSubmit.submitToBot}}
          @icon="paper-plane"
          @translatedTitle={{i18n (themePrefix "input_submit")}}
          class="ai-bot-button btn-primary"
        />
      </div>
      <p class="ai-disclaimer">
        {{i18n (themePrefix "disclaimer")}}
      </p>
    </div>
  </template>
}
