import { apiInitializer } from "discourse/lib/api";
import icon from "discourse-common/helpers/d-icon";

export default apiInitializer("1.8.0", (api) => {
  api.renderInOutlet("user-dropdown-notifications__before", <template>
    {{icon "bell"}}
  </template>);
});
