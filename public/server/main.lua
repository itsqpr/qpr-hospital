local success, msg = lib.checkDependency('ox_lib', '2.5.2')
success, msg = lib.checkDependency('ox_inventory', '2.8.8')
if not success then error(msg) end

if cfg.general.versioncheck then lib.versionCheck('itsqpr/qpr-hospital') end
lib.locale()

local ox_inventory = exports.ox_inventory
GlobalState.hospitalState = cfg.statebag.set

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
	if not GlobalState.hospitalState then return end

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

lib.addCommand('group.admin', 'toggle:hospital', function(args, rawCommand)
	GlobalState.hospitalState = not GlobalState.hospitalState

	local hospitalState = GlobalState.hospitalState and 'open' or 'closed'

	TriggerClientEvent('chat:addMessage', - 1, {
		template = '<div class="chat-message text-system">Medical Center <span class="text-white">is now {0}.</span></div>',
		args = { hospitalState }
	})
end)
