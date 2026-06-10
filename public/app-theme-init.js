(function () {
	try {
		var k = "appTheme";
		var t = localStorage.getItem(k);
		if (t !== "light" && t !== "dark") t = "dark";
		document.documentElement.setAttribute("data-app-theme", t);
	} catch (e) {
		document.documentElement.setAttribute("data-app-theme", "dark");
	}
})();
