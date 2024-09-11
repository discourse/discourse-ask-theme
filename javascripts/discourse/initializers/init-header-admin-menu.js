import { apiInitializer } from "discourse/lib/api";
import CustomAdminMenu from "../components/custom-admin-menu";

export default apiInitializer("1.0", (api) => {
  const currentUser = api.getCurrentUser();

  if (currentUser.admin) {
    api.headerIcons.add("custom-admin-menu", CustomAdminMenu, {
      after: "search",
    });
  }
});
