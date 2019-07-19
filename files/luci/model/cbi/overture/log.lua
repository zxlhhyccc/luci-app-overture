-- Copyright 2011 Jo-Philipp Wich <jow@openwrt.org>
-- Licensed to the public under the Apache License 2.0.

local fs = require "nixio.fs"

local f = SimpleForm("overture",
		translate("log"))
f.reset = false
f.submit = false

local o = f:field(Value, "_custom")

o.template = "cbi/tvalue"
o.rows = 30

function o.cfgvalue(self, section)
	return fs.readfile("/var/log/overture.log")
end


return f
