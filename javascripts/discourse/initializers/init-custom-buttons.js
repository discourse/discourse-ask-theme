import { apiInitializer } from "discourse/lib/api";
import HomepageButtons from "../components/homepage-buttons";

export default apiInitializer("1.8.0", (api) => {
  api.renderInOutlet("ai-bot-conversations-above-input", HomepageButtons);
});
