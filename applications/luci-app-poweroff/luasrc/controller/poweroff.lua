
module("luci.controller.poweroff", package.seeall)


function index() 
    local e = entry({"admin","system","poweroff"},template("poweroffdevice/poweroffdevice"), _("PowerOff"), 92)
    e.dependent=false
    e.acl_depends = { "luci-app-poweroff" }
	entry({"admin","system","poweroff","poweroff"},post("action_poweroff"))
	entry({"admin","system","poweroff","reboot"},post("action_reboot"))
end

function action_poweroff()
    luci.sys.exec("/sbin/poweroff" )
end


function action_reboot()
    luci.sys.exec("/sbin/reboot" )
end
