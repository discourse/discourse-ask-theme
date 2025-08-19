import { withPluginApi } from "discourse/lib/plugin-api";
import PreloadStore from "discourse/lib/preload-store";
import { setDefaultHomepage } from "discourse/lib/utilities";

export default {
  name: "discourse-custom-homepage",
  initialize() {
    withPluginApi((api) => {
      const user = api.getCurrentUser();

      if (user) {
        setDefaultHomepage("discourse-ai/ai-bot/conversations");
      }
    });
  },
};
