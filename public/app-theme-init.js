(function () {
	var k = "appTheme";
	var t = "dark";
	try {
		t = localStorage.getItem(k);
		if (t !== "light" && t !== "dark") t = "dark";
		document.documentElement.setAttribute("data-app-theme", t);
	} catch {
		document.documentElement.setAttribute("data-app-theme", "dark");
	}
})();
