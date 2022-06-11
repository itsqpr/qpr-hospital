local success, msg = lib.checkDependency('ox_lib', '2.3.3')
success, msg = lib.checkDependency('ox_inventory', '2.8.6')
success, msg = lib.checkDependency('qtarget', '2.1.6')
if not success then error(msg) end

if cfg.versioncheck then lib.versionCheck('waddle1010/wd-hospital') end
lib.locale()

local ox_inventory = exports.ox_inventory
GlobalState.hospitalState = cfg.statebag.set -- Recommend leaving this set as 'true' in config.json. If set 'false' you will need to run the command below to enable treatment.

---@return menu option callbacks
lib.callback.register('treatment', function(source)
	if not GlobalState.hospitalState then return end

	local src = source
	local cache = nil

	if ox_inventory:GetItem(src, 'money').count >= cfg.treatment.price then
		ox_inventory:RemoveItem(src, 'money', cfg.treatment.price)
		cache = true
	else
		cache = false
	end

while cache == nil do Wait(50) end; return cache end)

lib.callback.register("bandage", function(source)
	local src = source
	local cache = nil

	if ox_inventory:GetItem(src, 'money').count >= 300 then
		ox_inventory:RemoveItem(src, 'money', cfg.bandage.price)
		ox_inventory:AddItem(src, 'bandage', 1)
		cache = true
	else
		cache = false
	end

while cache == nil do Wait(50) end; return cache end)

---@return hospital statebag
lib.addCommand('group.admin', 'toggle:hospital', function(args, rawCommand)
	GlobalState.hospitalState = not GlobalState.hospitalState

	local hospitalState = GlobalState.hospitalState and 'open' or 'closed'

	TriggerClientEvent('chat:addMessage', - 1, {
		template = '<div class="chat-message text-system">Pillbox Hospital <span class="text-white">is now {0}.</span></div>',
		args = { hospitalState }
	})
end)
