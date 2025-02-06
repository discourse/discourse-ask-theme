import Component from "@glimmer/component";
import { service } from "@ember/service";
import icon from "discourse/helpers/d-icon";
import { i18n } from "discourse-i18n";

export default class UserCardMetaData extends Component {
  @service currentUser;

  get uniqueId() {
    return this.args.outletArgs.user["ai_stream_conversation_unique_id"];
  }

  get username() {
    if (this.uniqueId) {
      return this.uniqueId.split("/u/")[1];
    }
  }

  get siteName() {
    if (this.uniqueId) {
      return this.uniqueId.split("/u/")[0].split("https://")[1];
    }
  }

  <template>
    {{#if this.currentUser.admin}}
      {{#if this.uniqueId}}
        <a
          href={{this.uniqueId}}
          target="_blank"
          rel="noopener noreferrer"
          class="user-card-meta__profile-link"
        >
          {{icon "up-right-from-square"}}
          {{this.username}}
          on
          {{this.siteName}}
        </a>
      {{else}}
        <a
          href="https://meta.discourse.org/u/{{@outletArgs.user.username_lower}}"
          target="_blank"
          rel="noopener noreferrer"
          class="user-card-meta__profile-link"
        >
          {{icon "up-right-from-square"}}
          {{@outletArgs.user.username}}
          {{i18n (themePrefix "meta.profile_link")}}
        </a>
      {{/if}}
    {{/if}}
  </template>
}
