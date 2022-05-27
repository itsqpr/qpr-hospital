lib.locale()
local qtarget = exports.qtarget
local doctor = `s_m_m_doctor_01`
print(doctor)

---@param function
---@return context menu
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

---@param export
---@return entity target
qtarget:AddTargetModel(doctor, {
	options = {
	{
		icon = 'fas fa-sign-in-alt',
		label = locale('target_label'),
		action = function()
			openContext()
		end
	}
},
distance = cfg.distance
})

---@param debug
---@return command
if cfg.debug then
RegisterCommand(locale('context_debug'), function()
	openContext()
 end)
end
