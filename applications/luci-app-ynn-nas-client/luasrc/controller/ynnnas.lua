
module("luci.controller.ynnnas", package.seeall)

function index() 
    local e = entry({"admin","nas","ynnnas"},template("ynn-nas-client/ynn-nas-client"), _("ynn nas"), 92)
    e.dependent = false
    e.i18n = "ynn-nas-client"
	entry({"admin","nas","ynn-nas-client","start"},post("start"))
	entry({"admin","nas","ynn-nas-client","restart"},post("restart"))
	entry({"admin","nas","ynn-nas-client","check"},call("check"))
	entry({"admin","nas","ynn-nas-client","disk"},call("disk"))
end

function start()
    luci.sys.exec("/etc/init.d/ynn-nas-client start")
    luci.sys.exec("/etc/init.d/ynn-tunnel start")
end

function restart()
    luci.sys.exec("/etc/init.d/ynn-nas-client restart")
    luci.sys.exec("/etc/init.d/ynn-tunnel start")
end

function check()
    local running=(luci.sys.call("[ ` ps -w | grep /usr/sbin/ynn-nas-client| grep -v grep | awk '{print $1}' | wc -l` -gt 0 ] > /dev/null") == 0)
	if running then
		 luci.http.write("1")
	else
		luci.http.write("0")
	end
end

function disk()
    local json=luci.sys.exec("lsblk --json /dev/sda")
	luci.http.header("Content-Type","application/json")
	luci.http.write(json)
end