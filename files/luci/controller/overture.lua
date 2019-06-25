module("luci.controller.overture", package.seeall)

function index()
	entry({"admin", "services", "overture"},
		alias("admin", "services", "overture", "general"),
		_("overture"), 60)

	entry({"admin", "services", "overture", "general"},
		form("overture/general"),
		_("general"), 10).leaf = true
end
