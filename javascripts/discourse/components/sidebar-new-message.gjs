import DButton from "discourse/components/d-button";
import { i18n } from "discourse-i18n";

const SidebarNewMessage = <template>
  <DButton
    @route="/"
    @translatedLabel={{i18n (themePrefix "new_question")}}
    @icon="plus"
    class="ai-new-question-button btn-default"
  />
</template>;

export default SidebarNewMessage;
