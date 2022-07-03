lib.locale()

local function notify(str)
	local data = wd.notify[str]

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
	if lib.progressCircle({
        duration = 3500,
        position = 'bottom',
	      label = '',
        anim = {
            dict = 'move_m@_idles@shake_off',
            clip = 'shakeoff_1'
        },
    }) then
			SetEntityHealth(cache.ped, 200)
			notify('playerTreated')
			StartScreenEffect('HeistTripSkipFade', - 1, true)
			Wait(cfg.treatment.effectduration)
			StopAllScreenEffects(cache.ped)
			ClearPedTasksImmediately(cache.ped)
    else
      print('canceled')
    end
 end

RegisterNetEvent('treatment', function()
	if cfg.treatment.costmoney then
	lib.callback('treatment', false, function(response)
		if response then notify('playerBilled')
		print('You have been billed $%s.')
		onCheckIn() elseif not response then
		print('You need $%s in order to get treated.')
		notify('noMoney') end end)
 elseif not cfg.treatment.costmoney then onCheckIn() end
end)

RegisterNetEvent('bandage', function()
	lib.callback('bandage', false, function(success)
	if success then notify('boughtBandage') elseif not success then
		print('You need $%s in order to purchase a bandage.')
		notify('noMoney') end end)
end)
