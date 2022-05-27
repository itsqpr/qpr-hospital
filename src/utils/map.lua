CreateThread(function()
	blip = AddBlipForCoord(cfg.npc.x, cfg.npc.y)
	SetBlipSprite(blip, cfg.id)
	SetBlipScale(blip, cfg.size)
	SetBlipColour(blip, cfg.color)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString(cfg.name)
	EndTextCommandSetBlipName(blip)
end)