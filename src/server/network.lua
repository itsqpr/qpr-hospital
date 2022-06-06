local entity = nil

local function npc()
	if not entity then
		local ped = CreatePed(4, 's_m_m_doctor_01', cfg.npc.x, cfg.npc.y, cfg.npc.z, cfg.npc.h, true, false)
		entity = NetworkGetNetworkIdFromEntity(ped)
		FreezeEntityPosition(ped, true) end
	end

AddEventHandler('onResourceStart', function(resourceName)
		if GetCurrentResourceName() ~= resourceName then return end
		npc()
end)

	AddEventHandler('onResourceStop', function(resourceName)
		if entity then if GetCurrentResourceName() ~= resourceName then return end
		local entity = NetworkGetEntityFromNetworkId(ped)
		DeleteEntity(entity); entity = nil end
end)
