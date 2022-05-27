lib.locale()
local anim, dict = 'move_m@_idles@shake_off', 'shakeoff_1'

---@param functions
local function animation()
	lib.requestAnimDict(anim)
	while not HasAnimDictLoaded(anim) do
		Wait(0)
	end
	TaskPlayAnim(cache.ped, anim, dict, 3.0, - 3.0, - 1, 1, 0, false, false, false)
end

local function onCheckIn()
	SetEntityHealth(cache.ped, 200)
	animation()
	local ox_inventory = exports.ox_inventory
	ox_inventory:Progress({
		duration = 3500,
		position = 'bottom',
		label = locale('being_treated')
	}, function(cancel)
		if not cancel then
			lib.notify({
				title = locale('hospital_name'),
				description = locale('player_treated'),
				position = 'top',
				duration = 5000,
				style = {
					backgroundColor = '#7fa995',
					color = 'white'
				},
				icon = 'notes-medical',
				iconColor = 'white'
			})
			ClearPedTasksImmediately(cache.ped)
		end
	end)
end

---@param events
RegisterNetEvent('treatment', function()
	if cfg.treatmentcostmoney then
	lib.callback('treatment', false, function(response)
		if response then
		print('You have been billed $%s.')
		lib.notify({
			title = locale('hospital_name'),
			description = locale('player_billed'),
			position = 'top',
			duration = 5000,
			style = {
				backgroundColor = '#6187a2',
				color = 'white'
			},
			icon = 'file-invoice-dollar',
			iconColor = 'white'
		})
		onCheckIn()
	elseif not response then
		print('You need $%s in order to get treated.')
		lib.notify({
			title = locale('hospital_name'),
			description = locale('no_money'),
			position = 'top',
			duration = 3500,
			style = {
				backgroundColor = '#b57f7f',
				color = 'white'
			},
			icon = 'notes-medical',
			iconColor = 'white'
		})
	end
end)
elseif not cfg.treatmentcostmoney then
	onCheckIn()
	end
end)

RegisterNetEvent('bandage', function()
	lib.callback('bandage', false, function(success)
	if success then
		lib.notify({
			title = locale('hospital_name'),
			description = locale('bandage'),
			position = 'top',
			duration = 5000,
			style = {
				backgroundColor = '#7fa995',
				color = 'white'
			},
			icon = 'notes-medical',
			iconColor = 'white'
		})
	elseif not success then
		print('You need $%s in order to purchase a bandage.')
		lib.notify({
			title = locale('hospital_name'),
			description = locale('second_no_money'),
			position = 'top',
			duration = 3500,
			style = {
				backgroundColor = '#b57f7f',
				color = 'white'
			},
			icon = 'notes-medical',
			iconColor = 'white'
		})
	end
 end)
end)
