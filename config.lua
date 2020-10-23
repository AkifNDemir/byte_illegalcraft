Config = {
	Zones = {
		etilalkol =    {x = 1117.66,  y = -3139.15, z = 4.9, legality = 'legal'}, -- Alkol
		lityum =     {x = 1110.95,  y = -3127.44, z = 4.9, legality = 'illegal'}, -- Lityum
		aseton =      {x = 1106.97,  y = -3139.6, z = 4.9, legality = 'illegal'}, -- Aseton
		meth =          {x = 1099.06,  y = -3127.67, z = 4.9, legality = 'illegal'}, -- Meth
		pismismeth =  {x = 1096.05, y = -3139.65, z = 4.9, legality = 'illegal'}, -- PismisMeth
		lityumpil =      {x = 1084.03,  y = -3127.33, z = 4.9, legality = 'illegal'} -- LityumPil
	},
	Items = {
		["etilalkol"] = {
			Item = {
				[1] = {Name = 'beer', Req = 5}
			},
			Count = {Count = 1},
			ChanceItem = { CItem = '', CGive = 0, GiveBackItem = '', GBCount = 0, Chance = 100},
			Time = 3500
		},
		["lityum"] = {
			Item = {
				[1] = {Name = 'copper', Req = 3},
				[2] = {Name = 'gold', Req = 1}
			},
			Count = {Count = 1},
			ChanceItem = { CItem = '', CGive = 0, GiveBackItem = '', GBCount = 0, Chance = 100},
			Time = 5000
		},
		["aseton"] = {
			Item = {
				[1] = {Name = 'etilalkol', Req = 3},
				[2] = {Name = 'yag', Req = 1}
			},
			Count = {Count = 1},
			ChanceItem = { CItem = '', CGive = 0, GiveBackItem = '', GBCount = 0, Chance = 100},
			Time = 3500
		},
		["lityumpil"] = {
			Item = {
				[1] = {Name = 'lityum', Req = 1},
				[2] = {Name = 'safasit', Req = 3}
			},
			Count = {Count = 1},
			ChanceItem = { CItem = '', CGive = 0, GiveBackItem = '', GBCount = 0, Chance = 100},
			Time = 3500
		},
		["meth"] = {
			Item = {
				[1] = {Name = 'lityumpil', Req = 1},
				[2] = {Name = 'aseton', Req = 1},
				[3] = {Name = 'vitaminplus', Req = 2}
			},
			Count = {Count = 1},
			ChanceItem = { CItem = '', CGive = 0, GiveBackItem = '', GBCount = 0, Chance = 100},
			Time = 5500
		},
		["pismismeth"] = {
			Item = {
				[1] = {Name = 'meth', Req = 1},
				[2] = {Name = 'madde', Req = 1}
			},
			Count = {Count = 1},
			ChanceItem = { CItem = 'viagra', CGive = 1, GiveBackItem = 'madde', GBCount = 1, Chance = 60},
			Time = 7000
		},
	},
	Maddeler = {
		vector3(1096.23, -3124.12, 5.9),
		vector3(1101.23, -3124.12, 5.9),
		vector3(1106.23, -3124.12, 5.9),
		vector3(1111.23, -3124.12, 5.9),
		vector3(1116.23, -3124.12, 5.9),
		vector3(1121.23, -3124.12, 5.9),
		vector3(1126.23, -3124.12, 5.9),
		vector3(1096.23, -3130.41, 5.9),
		vector3(1096.23, -3130.41, 5.9),
		vector3(1096.23, -3130.41, 5.9),
	}
}
Config.Madde = 'madde'
Config.MaddeCount = 1
Config.MarkerType   = 1
Config.DrawDistance = 40.0
Config.ZoneSize     = {x = 2.0, y = 2.0, z = 1.0}
Config.MarkerColor  = {r = 255, g = 0, b = 0}
Config.MarkerColorL  = {r = 0, g = 255, b = 0}
Config.RequiredCopsAlkol = 0
Config.RequiredCopsAseton = 0
Config.RequiredCopsLityum = 0
Config.RequiredCopsLityumpil = 0
Config.RequiredCopsMeth = 0
Config.RequiredCopsPismisMeth = 0
Config.Locale = 'tr'
