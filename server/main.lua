ESX 						   = nil
local CopsConnected       	   = 0
local PlayersStartingCrafting 	= {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()
	local xPlayers = ESX.GetPlayers()
	CopsConnected = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end
	SetTimeout(5000, CountCops)
end
CountCops()
local function CraftItem(source, item, Count)
	local CraftTime = Config.Items[item].Time 
	SetTimeout(CraftTime, function()
		local IsEverythingTrue = true
		local _itemName = {}
		local _itemReq = {}
		local itemQuantity = {}
		local itemCheck = {}
		local ChanceItem = ''
		local CGive = 0
		local Chance = 0
		local GBCount = 0
		local GBItem = ''
        local xPlayer  = ESX.GetPlayerFromId(source)
		ChanceItem = Config.Items[item].ChanceItem.CItem
		GBItem = Config.Items[item].ChanceItem.GiveBackItem
		CGive = Config.Items[item].ChanceItem.CGive
		Chance = Config.Items[item].ChanceItem.Chance
		GBCount = Config.Items[item].ChanceItem.GBCount
		print('item  '  ..item)
		print('ChanceItem   ' ..ChanceItem.. '   CGiveCount    '  ..CGive..  '   Chance   '..Chance..'   GBItem   ' ..GBItem..  '   GBCount   '..GBCount..'..')
		if PlayersStartingCrafting[source] == true then
			for i in pairs(Config.Items[item].Item) do
				_itemName[i] = Config.Items[item].Item[i].Name
				itemQuantity[i] = xPlayer.getInventoryItem(_itemName[i]).count
				_itemReq[i] = Config.Items[item].Item[i].Req
				if itemQuantity[i] >= _itemReq[i] then
					itemCheck[i] = true
				else
					itemCheck[i] = false
					PlayersStartingCrafting[source] = false
					TriggerClientEvent('esx:showNotification', source, _U('not_enough_item'))
					break
				end
			end
			for j in pairs(itemCheck) do
				if not itemCheck[j] then
					IsEverythingTrue = false
					break
				end
			end
			if IsEverythingTrue then
				local randomChance = math.random(0,100)
				for k in pairs(_itemName, _itemReq) do
					local _item = _itemName[k]
					local _req = _itemReq[k]
					xPlayer.removeInventoryItem(_item, _req)
					print(' in remove items ')
				end
				print('Chance '..Chance..  '   random' ..randomChance.. ' ..')
				if randomChance <= Chance then
					xPlayer.addInventoryItem(item, Count)
					print('normal')
				elseif randomChance > Chance then
					xPlayer.addInventoryItem(ChanceItem, CGive)
					xPlayer.addInventoryItem(GBItem, GBCount)
					print('chance')
				else
					
				end
				CraftItem(source, item, Count)
				print(' add items ')
			end
		end
	end)
end

RegisterServerEvent('byte_illegalcraft:startCraftItem')
AddEventHandler('byte_illegalcraft:startCraftItem', function(item, Count)
	local _source = source
	PlayersStartingCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	CraftItem(_source, item, Count)
end)
RegisterServerEvent('byte_illegalcraft:stopCraftItem')
AddEventHandler('byte_illegalcraft:stopCraftItem', function()
	local _source = source
	PlayersStartingCrafting[_source] = false
	--ExecuteCommand(envKontrol)
	-- use this command if you are using disc and not synching properly as items droppng (-) minus in user_inventory
end)

------------------- Madde -------------------
RegisterNetEvent('byte_illegalcraft:giveMadde')
AddEventHandler('byte_illegalcraft:giveMadde', function(item, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, count)
	TriggerClientEvent('esx:showNotification', source, _U('add_madde'))
end)

--Envanteri getir--
RegisterServerEvent('byte_illegalcraft:GetUserInventory')
AddEventHandler('byte_illegalcraft:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('byte_illegalcraft:ReturnInventory', 
    	_source, 
    	xPlayer.getInventoryItem('lityum').count, 
		xPlayer.getInventoryItem('lityumpil').count,
		xPlayer.getInventoryItem('safasit').count,  
		xPlayer.getInventoryItem('yag').count,
		xPlayer.getInventoryItem('etilalkol').count,  
		xPlayer.getInventoryItem('vitaminplus').count,
		xPlayer.getInventoryItem('aseton').count, 
		xPlayer.getInventoryItem('meth').count,
		xPlayer.getInventoryItem('pismismeth').count,
		xPlayer.getInventoryItem('viagra').count,
		xPlayer.getInventoryItem('madde').count,
		xPlayer.getInventoryItem('gold').count,
		xPlayer.getInventoryItem('copper').count,
		xPlayer.getInventoryItem('beer').count,
		xPlayer.job.name, 
		currentZone
    )
end)