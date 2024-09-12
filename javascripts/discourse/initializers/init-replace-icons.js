import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "custom-icons",
  initialize() {
    withPluginApi("1.37.1", (api) => {
      api.replaceIcon("flag", "far-thumbs-down");
      api.replaceIcon("d-unliked", "far-thumbs-up");
      api.replaceIcon("d-liked", "thumbs-up");
    });
  },
};
