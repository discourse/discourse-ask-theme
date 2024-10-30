import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { on } from "@ember/modifier";
import { LinkTo } from "@ember/routing";
import { service } from "@ember/service";
import icon from "discourse-common/helpers/d-icon";
import i18n from "discourse-common/helpers/i18n";
import DMenu from "float-kit/components/d-menu";

export default class CustomAdminMenu extends Component {
  @service currentUser;
  @service store;
  @service pmTopicTrackingState;

  @tracked botUser = null;

  constructor() {
    super(...arguments);
    this.loadBotUser();
  }

  get modHasMessages() {
    this.pmTopicTrackingState.activeGroup = "moderators";
    return this.pmTopicTrackingState.newIncoming?.length;
  }

  <template>
    <li class="custom-admin-menu">
      <DMenu
        @icon="cog"
        @placement="bottom-end"
        @identifier="custom-admin-menu"
        @triggerClass="icon btn-flat {{if this.modHasMessages '-has-messages'}}"
        @groupIdentifier="custom-header"
      >
        <:content as |args|>
          {{! template-lint-disable no-invalid-interactive }}
          <ul
            class="custom-admin-menu__links custom-menu"
            {{on "click" args.close}}
          >
            <li>
              <LinkTo @route="admin">
                <span>
                  {{icon "wrench"}}
                  {{i18n "sidebar.sections.community.links.admin.content"}}
                </span>
              </LinkTo>
            </li>
            <li>
              <a href="/admin/plugins/explorer?id=4&params=null">
                <span>
                  {{icon "thumbs-up"}}
                  {{i18n (themePrefix "admin_menu.liked_messages")}}
                </span>
              </a>
            </li>
            <li>
              <LinkTo @route="group.messages.inbox" @model="moderators">
                <span>
                  {{icon "thumbs-down"}}
                  {{i18n (themePrefix "admin_menu.mod_messages")}}
                  {{#if this.modHasMessages}}
                    <span class="mod-message-badge"></span>
                  {{/if}}
                </span>
              </LinkTo>
            </li>
            <li>
              <a href="/u/discoursehelper/messages">
                <span>
                  {{icon "envelope"}}
                  {{i18n (themePrefix "admin_menu.all_messages")}}
                </span>
              </a>
            </li>
            <li>
              <a href="/admin/plugins/discourse-ai/ai-llms">
                <span>
                  {{icon "discourse-sparkles"}}{{i18n
                    (themePrefix "admin_menu.ai_config")
                  }}
                </span>
              </a>
            </li>
          </ul>
        </:content>
      </DMenu>
    </li>
  </template>
}
