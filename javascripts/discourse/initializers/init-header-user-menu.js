import { apiInitializer } from "discourse/lib/api";
import CustomUserMenu from "../components/custom-user-menu";

export default apiInitializer("1.0", (api) => {
  const currentUser = api.getCurrentUser();

  if (currentUser) {
    api.headerIcons.add("custom-user-menu", CustomUserMenu, {
      after: "search",
    });
  }
});
