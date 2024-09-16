import { apiInitializer } from "discourse/lib/api";
import UserCardMetaData from "../components/user-card-meta-data";

export default apiInitializer("1.8.0", (api) => {
  api.renderInOutlet("user-card-before-badges", UserCardMetaData);
});
