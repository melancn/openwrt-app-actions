
module("luci.controller.ynnnas", package.seeall)

function index() 
    local e = entry({"admin","nas","ynn"},template("ynn-nas-client/ynn-nas-client"), _("ynn-nas-client"), 92)
    e.dependent = false
    e.i18n = "ynn-nas-client"
	entry({"admin","nas","ynn-nas-client","start"},post("start"))
	entry({"admin","nas","ynn-nas-client","check"},get("check"))
end

function start()
    luci.sys.exec("/etc/init.d/ynn-nas-client start")
    luci.sys.exec("/etc/init.d/ynn-tunnel start")
end

function check()
    local running=(luci.sys.call("[ ` ps -w | grep ynn-nas-client| grep -v grep | awk '{print $1}' | wc -l` -gt 0 ] > /dev/null") == 0)
	return running
end