lib.locale()

wd = {}
wd.notify = {
	-- treatment
	['playerTreated'] = {
		title = locale('hospital_name'),
		description = locale('player_treated'),
		position = 'top',
		duration = 5000,
		backgroundColor = '#475569',
		color = 'white',
		icon = 'notes-medical',
		iconColor = 'darkseagreen'
	},

	['playerBilled'] = {
		title = locale('hospital_name'),
		description = locale('player_billed'),
		position = 'top',
		duration = 5000,
		backgroundColor = '#475569',
		color = 'white',
		icon = 'file-invoice-dollar',
		iconColor = 'darkseagreen'
	},

	['noMoney'] = {
		title = locale('hospital_name'),
		description = locale('no_money'),
		position = 'top',
		duration = 3500,
		backgroundColor = '#475569',
		color = 'white',
		icon = 'file-invoice-dollar',
		iconColor = 'lightcoral'
	},

	['boughtBandage'] = {
		title = locale('hospital_name'),
		description = locale('bandage'),
		position = 'top',
		duration = 5000,
		backgroundColor = '#475569',
		color = 'white',
		icon = 'notes-medical',
		iconColor = 'darkseagreen'
	},

	-- damages
	['playerBleeding'] = {
		title = locale('your_bleeding'),
		description = locale('medical_attention'),
		position = 'top',
		duration = 5000,
		backgroundColor = '#475569',
		color = 'white',
		icon = 'notes-medical',
		iconColor = 'lightcoral'
	},

	['playerKnockedOut'] = {
		title = locale('knocked_out'),
		description = locale('lost_balance'),
		position = 'top',
		duration = 18000,
		backgroundColor = '#475569',
		color = 'white',
		icon = 'brain',
		iconColor = 'lightcoral'
	}
}
