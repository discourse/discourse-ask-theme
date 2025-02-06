import Component from "@glimmer/component";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import bodyClass from "discourse/helpers/body-class";
import { i18n } from "discourse-i18n";
import HomepageButtons from "../components/homepage-buttons";
import SimpleTextareaInteractor from "../lib/simple-textarea-interactor";

export default class CustomHomepage extends Component {
  @service hiddenSubmit;

  textareaInteractor = null;

  @action
  updateInputValue(event) {
    this.hiddenSubmit.inputValue = event.target.value;
  }

  @action
  handleKeyDown(event) {
    if (event.key === "Enter" && !event.shiftKey) {
      this.hiddenSubmit.submitToBot();
    }
  }

  @action
  initializeTextarea(element) {
    this.textareaInteractor = new SimpleTextareaInteractor(element);
  }

  <template>
    {{bodyClass "custom-homepage"}}
    <div class="custom-homepage__content-wrapper">
      <h1>{{i18n (themePrefix "title")}}</h1>
      <HomepageButtons />
      <div class="custom-homepage__input-wrapper">
        <textarea
          {{didInsert this.initializeTextarea}}
          {{on "input" this.updateInputValue}}
          {{on "keydown" this.handleKeyDown}}
          id="custom-homepage-input"
          placeholder={{i18n (themePrefix "input_placeholder")}}
          minlength="10"
          rows="1"
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
