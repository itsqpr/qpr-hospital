if cfg.framework.esx then
	RegisterNetEvent('esx:playerLoaded', function()
		playerLoaded = true
	end)
elseif cfg.framework.ox then
	RegisterNetEvent('ox:playerLoaded', function()
		playerLoaded = true
	end)
end
