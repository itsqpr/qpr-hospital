lib.locale()

---@param functions
local function notify(str)
	local data = w.notify[str]

	lib.notify({
		title = data.title,
		description = data.description,
		position = data.position,
		duration = data.duration,
		style = {
			backgroundColor = data.backgroundColor,
			color = data.color
		},
		icon = data.icon,
		iconColor = data.iconColor
	})
end

local function onCheckIn()
	SetEntityHealth(cache.ped, 200)
	if lib.progressCircle({
        duration = 3500,
        position = 'bottom',
	label = '',
        disable = {
	    move = true,
        },
        anim = {
            dict = 'move_m@_idles@shake_off',
            clip = 'shakeoff_1'
        },
    }) then
			notify('playerTreated')
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
		notify('playerBilled')
		onCheckIn()
	elseif not response then
		print('You need $%s in order to get treated.')
		notify('noMoney')
	end
end)
elseif not cfg.treatmentcostmoney then
	onCheckIn()
	end
end)

RegisterNetEvent('bandage', function()
	lib.callback('bandage', false, function(success)
	if success then notify('boughtBandage') elseif not success then
		print('You need $%s in order to purchase a bandage.')
		notify('secondNoMoney')
	end
 end)
end)
