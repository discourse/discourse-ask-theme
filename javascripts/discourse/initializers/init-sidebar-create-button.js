import { apiInitializer } from "discourse/lib/api";
import SidebarNewMessage from "../components/sidebar-new-message";

export default apiInitializer("1.8.0", (api) => {
  api.renderInOutlet("after-sidebar-sections", SidebarNewMessage);
});
