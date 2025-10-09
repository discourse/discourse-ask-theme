import PoweredByDiscourse from "discourse/components/powered-by-discourse";
import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  api.renderInOutlet("sidebar-footer-actions", PoweredByDiscourse);
});
