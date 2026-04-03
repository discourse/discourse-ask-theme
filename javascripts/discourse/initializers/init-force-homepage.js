import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "discourse-custom-homepage",
  initialize() {
    withPluginApi((api) => {
      if (api.getCurrentUser()) {
        api.modifyClass(
          "route:discovery.index",
          (Superclass) =>
            class extends Superclass {
              beforeModel() {
                this.router.transitionTo("/discourse-ai/ai-bot/conversations");
              }
            }
        );
      }
    });
  },
};
