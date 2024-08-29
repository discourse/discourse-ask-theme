import Component from "@glimmer/component";
import { fn } from "@ember/helper";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";

export default class HomepageButtons extends Component {
  @service hiddenSubmit;

  @action
  updateAndSubmit(value) {
    this.hiddenSubmit.inputValue = value;
    this.hiddenSubmit.submitToBot();
  }

  <template>
    <div class="custom-homepage__button-wrapper">
      {{#each settings.quick_links as |link|}}
        <DButton
          @action={{fn this.updateAndSubmit link.question}}
          @translatedLabel={{link.question}}
          class="ai-question-button btn-flat"
        />
      {{/each}}
    </div>
  </template>
}
