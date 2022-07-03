lib.locale()

local function openContext()
	lib.registerContext({
		id = 'hospital_context',
		title = locale('hospital_name'),
		options = {
			[locale('need_bandage')] = {
				description = locale('first_description'),
				event = 'bandage'
			},
			[locale('medical_treatment')] = {
				menu = 'treatment_menu',
				arrow = true,
				description = locale('second_description')
			},
		},
		{
			id = 'treatment_menu',
			title = locale('do_you_wish'),
			menu = 'treatment_menu',
			options = {
				[locale('yes')] = {
					metadata = { locale('metadata') },
					event = 'treatment'
				}
			}
		}
	})
	lib.showContext('hospital_context')
end

if cfg.utility.lib then
	local location = vector3(cfg.lib_point.x, cfg.lib_point.y, cfg.lib_point.z)
	local point = lib.points.new(location, 1, {})

	checkIn = SetInterval(function()
		function point:onEnter()
			lib.showTextUI("Press [E] to open the hospital menu")
		end

		function point:nearby()
			if self.currentDistance < 2 and IsControlJustReleased(0, 38) then
				openContext()
		end

		function point:onExit()
			lib.hideTextUI()
			end
		end
	end)
end

if cfg.utility.qtarget then
	local qtarget = exports.qtarget
	local doctor = cfg.npc.model
	print(doctor)

	qtarget:AddTargetModel(doctor, {
		options = {
		{
			icon = 'fas fa-sign-in-alt',
			label = 'Check-In',
			action = function()
				openContext()
			end
		}
	},
	distance = 3.5
	})
end

if cfg.general.debug then
	RegisterCommand('debug:hospital', function()
		openContext()
	end)
end
