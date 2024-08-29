import { apiInitializer } from "discourse/lib/api";
import customHomepage from "../components/custom-homepage";

export default apiInitializer("1.8.0", (api) => {
  api.renderInOutlet("custom-homepage", customHomepage);
});
