import Component from "@glimmer/component";
import { on } from "@ember/modifier";
import { LinkTo } from "@ember/routing";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import avatar from "discourse/helpers/bound-avatar-template";
import routeAction from "discourse/helpers/route-action";
import icon from "discourse-common/helpers/d-icon";
import i18n from "discourse-common/helpers/i18n";
import DMenu from "float-kit/components/d-menu";

export default class CustomUserMenu extends Component {
  @service currentUser;

  <template>
    <li class="custom-user-menu">
      <DMenu
        @placement="bottom-end"
        @identifier="custom-user-menu"
        @triggerClass="icon btn-flat"
        @groupIdentifier="custom-header"
      >
        <:trigger>
          {{avatar this.currentUser.avatar_template "medium"}}
        </:trigger>

        <:content as |args|>
          {{! template-lint-disable no-invalid-interactive }}
          <ul
            class="custom-user-menu__links custom-menu"
            {{on "click" args.close}}
          >
            <li>
              <LinkTo @route="userPrivateMessages" @model={{this.currentUser}}>
                <span>{{icon "envelope"}}{{i18n
                    (themePrefix "user_menu.all_questions")
                  }}</span>
              </LinkTo>
            </li>
            <li>
              <a
                href="https://meta.discourse.org/t/help-us-test-ask-discourse-com/324441"
              >
                <span>
                  {{icon "fab-discourse"}}{{i18n
                    (themePrefix "user_menu.feedback")
                  }}
                </span>
              </a>
            </li>
            <li>
              <LinkTo
                @route="preferences.interface"
                @model={{this.currentUser}}
              >
                <span>{{icon "palette"}}{{i18n
                    (themePrefix "user_menu.appearance")
                  }}</span>
              </LinkTo>
            </li>
            <li>
              <LinkTo @route="preferences.account" @model={{this.currentUser}}>
                <span>{{icon "user"}}{{i18n
                    (themePrefix "user_menu.account")
                  }}</span>
              </LinkTo>
            </li>
            <li>
              <DButton
                @action={{routeAction "logout"}}
                class="btn-flat profile-tab-btn"
              >
                {{icon "sign-out-alt"}}
                <span class="item-label">
                  {{i18n "user.log_out"}}
                </span>
              </DButton>
            </li>
          </ul>
        </:content>
      </DMenu>
    </li>
  </template>
}
