import icon from "discourse/helpers/d-icon";
import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("1.8.0", (api) => {
  api.renderInOutlet("user-dropdown-notifications__before", <template>
    {{icon "bell"}}
  </template>);
});
