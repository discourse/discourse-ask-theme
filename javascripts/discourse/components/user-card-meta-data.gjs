import Component from "@glimmer/component";
import { service } from "@ember/service";
import icon from "discourse-common/helpers/d-icon";
import i18n from "discourse-common/helpers/i18n";

export default class UserCardMetaData extends Component {
  @service currentUser;

  <template>
    {{#if this.currentUser.admin}}
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
  </template>
}
