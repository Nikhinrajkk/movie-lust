import { APP_THEME_STORAGE_KEY } from "@/lib/app-theme";

/** Blocking script for root layout `<head>` — runs before paint to avoid theme flash. */
export const APP_THEME_INIT_SCRIPT = `(function(){var k=${JSON.stringify(APP_THEME_STORAGE_KEY)};var t="dark";try{t=localStorage.getItem(k);if(t!=="light"&&t!=="dark")t="dark";document.documentElement.setAttribute("data-app-theme",t);}catch{document.documentElement.setAttribute("data-app-theme","dark");}})();`;
