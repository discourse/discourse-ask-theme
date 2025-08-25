import { apiInitializer } from "discourse/lib/api";
import HomepageButtons from "../components/homepage-buttons";

export default apiInitializer((api) => {
  api.renderInOutlet("ai-bot-conversations-above-input", HomepageButtons);
});
