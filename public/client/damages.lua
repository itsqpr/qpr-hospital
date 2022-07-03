lib.locale()

local timeout, knockedOut = 15, 50
local playerState = LocalPlayer.state

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

local function isBleeding()
	if cfg.framework then
		SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) - 2)
		if not LocalPlayer.state.bleeding then
			playerState.bleeding = true
		end
		notify('playerBleeding')
		ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', cfg.bleeding.shake)
	end
	Wait(2800)
end

if cfg.bleeding.set then
	isHurt = SetInterval(function()
		if GetEntityHealth(cache.ped) < cfg.bleeding.start then
		isBleeding()
	elseif GetEntityHealth(cache.ped) > cfg.bleeding.finish then
		playerState.bleeding = false
	end
 end) end

playerState.hurt = true
if cfg.damagedwalk.set then
	damagedWalk = SetInterval(function()
		if GetEntityHealth(cache.ped) <= cfg.damagedwalk.start then
		lib.requestAnimSet('move_m@injured')
		SetPedMovementClipset(cache.ped, 'move_m@injured', true)
	elseif LocalPlayer.state.hurt and GetEntityHealth(cache.ped) > cfg.damagedwalk.finish then
		ResetPedMovementClipset(cache.ped)
		ResetPedStrafeClipset(cache.ped)
	end
 end) end

playerState.knockedOut = false

if cfg.knockout.set then
	Dazed = SetInterval(function()
		local entity = GetPlayerPed(-1)
		if IsPedInMeleeCombat(cache.ped, entity) then
			if GetEntityHealth(cache.ped, entity) < cfg.knockout.start then
				playerState.knockedOut = true
				SetPedToRagdoll(entity, 1000, 1000, 0, 0, 0, 0)
			  SetPlayerInvincible(cache.ped, true)
			  timeout = 20
			  notify('playerKnockedOut')
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
end) end

if cfg.spam_jump.set then
	local chance = cfg.spam_jump.chance
	playerState.fellOver = true

	fellOver = SetInterval(function()
		local state = cache.ped
		if IsPedOnFoot(state) and not IsPedSwimming(state) and (IsPedRunning(state) or IsPedSprinting(state)) and not IsPedClimbing(state) and IsPedJumping(state) and not IsPedRagdoll(state) then
			local result = math.random()
			if result < chance then
				Wait(600)
				SetPedToRagdoll(state, 5000, 1, 2)
			end
		end
end) end
