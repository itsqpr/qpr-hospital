lib.locale()
---@param functions
local function onCheckIn()
	SetEntityHealth(cache.ped, 200)
	if lib.progressCircle({
        duration = 3500,
        position = 'bottom',
        disable = {
	    move = true,
        },
        anim = {
            dict = 'move_m@_idles@shake_off',
            clip = 'shakeoff_1'
        },
    }) then
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
			StartScreenEffect('HeistTripSkipFade', - 1, true)
			Wait(40000)
			StopAllScreenEffects(cache.ped)
			ClearPedTasksImmediately(cache.ped)
    else
        print('canceled')
    end
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

