-- Copyright 2011 Jo-Philipp Wich <jow@openwrt.org>
-- Licensed to the public under the Apache License 2.0.

local fs = require "nixio.fs"

local f = SimpleForm("overture",
		translate("config"))

local o = f:field(Value, "_custom")

o.template = "cbi/tvalue"
o.rows = 30

function o.cfgvalue(self, section)
	return fs.readfile("/etc/overture/config.json")
end

function o.write(self, section, value)
	value = value:gsub("\r\n?", "\n")
	fs.writefile("/etc/overture/config.json", value)
	require("luci.sys").call("/etc/init.d/overture restart >/dev/null 2<&1")
	require("nixio").syslog('info', 'Restarting overture on custom /etc/overture/config.json change')
end

f.submit = translate("Save&Restart")

return f
