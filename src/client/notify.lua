lib.locale()
w = {}

w.notify = {

	-- treatment
	['playerTreated'] = {
		title = locale('hospital_name'),
		description = locale('player_treated'),
		position = 'top',
		duration = 5000,
		backgroundColor = '#7fa995',
		color = 'white',
		icon = 'notes-medical',
		iconColor = 'white'
	},

	['playerBilled'] = {
		title = locale('hospital_name'),
		description = locale('player_billed'),
		position = 'top',
		duration = 5000,
		backgroundColor = '#6187a2',
		color = 'white',
		icon = 'file-invoice-dollar',
		iconColor = 'white'
	},

	['noMoney'] = {
		title = locale('hospital_name'),
		description = locale('no_money'),
		position = 'top',
		duration = 3500,
		backgroundColor = '#b57f7f',
		color = 'white',
		icon = 'notes-medical',
		iconColor = 'white'
	},

	['boughtBandage'] = {
		title = locale('hospital_name'),
		description = locale('bandage'),
		position = 'top',
		duration = 5000,
		backgroundColor = '#7fa995',
		color = 'white',
		icon = 'notes-medical',
		iconColor = 'white'
	},

	['secondNoMoney'] = {
		title = locale('hospital_name'),
		description = locale('second_no_money'),
		position = 'top',
		duration = 3500,
		backgroundColor = '#b57f7f',
		color = 'white',
		icon = 'notes-medical',
		iconColor = 'white'
	},

	-- damages
	['playerBleeding'] = {
		title = locale('your_bleeding'),
		description = locale('medical_attention'),
		position = 'top',
		duration = 5000,
		backgroundColor = '#b57f7f',
		color = 'white',
		icon = 'notes-medical',
		iconColor = 'white'
	},

	['playerKnockedOut'] = {
		title = locale('dazed'),
		description = locale('lost_balance'),
		position = 'top',
		duration = 18000,
		backgroundColor = '#9d85ac',
		color = 'white',
		icon = 'brain',
		iconColor = 'white'
	}
}
