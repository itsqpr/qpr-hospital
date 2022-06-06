lib.locale()
local timeout, knockedOut = 15, 50
local playerState = LocalPlayer.state

---@param functions
---@return bleeding
local function isBleeding()
	if cfg.framework then
		SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) - 2)
		if not LocalPlayer.state.bleeding then
			playerState.bleeding = true
		end
		lib.notify({
			title = locale('your_bleeding'),
			description = locale('medical_attention'),
			position = 'top',
			duration = 5000,
			style = {
				backgroundColor = '#b57f7f',
				color = 'white'
			},
			icon = 'notes-medical',
			iconColor = 'white'
		})
		ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', cfg.bleeding.shake)
	end
	Wait(2800)
end

if cfg.bleeding.set then
	SetInterval(function()
		if GetEntityHealth(cache.ped) < cfg.bleeding.start then
		isBleeding()
	elseif GetEntityHealth(cache.ped) > cfg.bleeding.finish then
		playerState.bleeding = false
	end
 end)
end

---@return damaged walk
playerState.hurt = true
if cfg.damagedwalk.set then
CreateThread(function()
	while playerState.hurt do
	Wait(0)
	if GetEntityHealth(cache.ped) <= cfg.damagedwalk.start then
		lib.requestAnimSet('move_m@injured')
		SetPedMovementClipset(cache.ped, 'move_m@injured', true)
	elseif LocalPlayer.state.hurt and GetEntityHealth(cache.ped) > cfg.damagedwalk.finish then
		ResetPedMovementClipset(cache.ped)
		ResetPedStrafeClipset(cache.ped)
	 end
  end
 end)
end

---@return knockout
playerState.knockedOut = false
if cfg.knockout.set then
CreateThread(function()
	while true do
   Wait(0)
   local entity = GetPlayerPed(-1)
   if IsPedInMeleeCombat(cache.ped, entity) then
	  if GetEntityHealth(cache.ped, entity) < cfg.knockout.start then
		playerState.knockedOut = true
		SetPedToRagdoll(entity, 1000, 1000, 0, 0, 0, 0)
		SetPlayerInvincible(cache.ped, true)
		timeout = 20
		lib.notify({
			duration = 18000,
			title = locale('dazed'),
			description = locale('lost_balance'),
			position = 'top',
			style = {
				backgroundColor = '#9d85ac',
				color = 'white'
			},
			icon = 'brain',
			iconColor = 'white'
		})
	end
end

if playerState.knockedOut == true then
	ResetPedRagdollTimer(entity)
	if timeout >= 0 then knockedOut = knockedOut - 1
		if knockedOut == 0 then knockedOut = 50
			timeout = timeout - 1
			SetEntityHealth(cache.ped, entity, 200)
		end
	  else
		  playerState.knockedOut = false
	  end
   end
  end
 end)
end
