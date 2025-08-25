import { withPluginApi } from "discourse/lib/plugin-api";
import { setDefaultHomepage } from "discourse/lib/utilities";

export default {
  name: "discourse-custom-homepage",
  initialize() {
    withPluginApi((api) => {
      const user = api.getCurrentUser();
      const aiBotinHeader = api.container.lookup(
        "service:site-settings"
      )?.ai_bot_add_to_header;

      // we can get stuck in a circular reference
      // if the bot header button is enabled
      // due to its fallback for lastKnownAppURL
      if (!aiBotinHeader && user) {
        setDefaultHomepage("discourse-ai/ai-bot/conversations");
      }
    });
  },
};
