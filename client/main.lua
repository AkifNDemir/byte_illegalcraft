local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local PID           			= 0
local GUI           			= {}
ESX 			    			= nil
GUI.Time            			= 0
local lityumS                   = 0
local lityumpilS                = 0
local safasitS                  = 0
local yagS                      = 0
local etilalkolS                = 0
local vitaminplusS              = 0
local asetonS                   = 0
local methS                     = 0
local pismismethS               = 0
local viagraS                   = 0
local maddeS                    = 0
local goldS                     = 0
local copperS                   = 0
local beerS                     = 0
local myJob 					= nil
local PlayerData 				= {}
local GUI 						= {}
local secilenKonum = nil
local isleniyor = false
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local CZone = ''


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

AddEventHandler('byte_illegalcraft:hasEnteredMarker', function(zone)
        ESX.UI.Menu.CloseAll()
		for k,v in pairs(Config.Zones) do
			if zone == k then
				if myJob ~= "police" then
					CurrentAction     = 'craft_item'
					CZone = zone
					if zone ==  'etilalkol' then
						CurrentActionMsg  = _U('press_transform_alkol')
					elseif zone ==  'lityum' then
						CurrentActionMsg  = _U('press_transform_lityum')
					elseif zone ==  'aseton' then
						CurrentActionMsg  = _U('press_transform_aseton')
					elseif zone ==  'meth' then
						CurrentActionMsg  = _U('press_transform_meth')
					elseif zone ==  'pismismeth' then
						CurrentActionMsg  = _U('press_transform_pismismeth')
					elseif zone ==  'lityumpil' then
						CurrentActionMsg  = _U('press_transform_lityumpil')
					else
						CurrentActionMsg  = _U('press_transform')
					end
					CurrentActionData = {}
				end
            end
        end
 end)

AddEventHandler('byte_illegalcraft:hasExitedMarker', function(zone)
        CurrentAction = nil
        ESX.UI.Menu.CloseAll()
        TriggerServerEvent('byte_illegalcraft:stopCraftItem')
end)
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
				if v.legality == "legal" then
					DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColorL.r, Config.MarkerColorL.g, Config.MarkerColorL.b, 100, false, true, 2, false, false, false, false)
				else
					DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				end
            end
        end

    end
end)

RegisterNetEvent('byte_illegalcraft:ReturnInventory')
AddEventHandler('byte_illegalcraft:ReturnInventory', function(lityum_, lityumpil_, safasit_, yag_, etilalkol_, vitaminplus_, aseton_, meth_, pismismeth_, viagra_, madde_, gold_, copper_, beer_, jobName, currentZone)
	lityumS       = lityum_
	lityumpilS 	  = lityumpil_
	safasitS 	  = safasit_
	yagS       = yag_
	etilalkolS       = etilalkol_
	vitaminplusS = vitaminplus_
	asetonS = aseton_
	methS = meth_
	pismismethS = pismismeth_
	viagraS = viagra_
	maddeS = madde_
	goldS = gold_
	copperS = copper_
	beerS = beer_
	myJob         = jobName
	TriggerEvent('byte_illegalcraft:hasEnteredMarker', currentZone)
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil
        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 1) then
                isInMarker  = true
                currentZone = k
            end
        end
        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            lastZone                = currentZone
            TriggerServerEvent('byte_illegalcraft:GetUserInventory', currentZone)
        end
        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('byte_illegalcraft:hasExitedMarker', lastZone)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustReleased(0, 38) then
                if CurrentAction == 'craft_item' then
					for k,v in pairs(Config.Items) do
						if CZone == k then
							local Count = v.Count.Count
							TriggerServerEvent('byte_illegalcraft:startCraftItem', k, Count)
						end
					end
                end
                CurrentAction = nil
            end
        end
    end
end)

----------- Madde Topla -----------
Citizen.CreateThread(function()
	local rastgele = math.random(1,#Config.Maddeler)   
	secilenKonum = Config.Maddeler[rastgele]
    while true do
        Citizen.Wait(1)
        local PlayerPed = PlayerPedId()
        local PlayerKordinat = GetEntityCoords(PlayerPed)
        local mesafe = #(PlayerKordinat - secilenKonum)
        local saat = GetClockHours()
        local dakika = GetClockMinutes()
        local ocnoble = saat .. dakika
        if (tonumber(ocnoble) >= 2000 and tonumber(ocnoble) <= 2110) or (tonumber(ocnoble) >= 2210 and tonumber(ocnoble) <= 2320) or (tonumber(ocnoble) >= 020 and tonumber(ocnoble) <= 0130) or (tonumber(ocnoble) >= 0230 and tonumber(ocnoble) <= 0340) or (tonumber(ocnoble) >= 0440 and tonumber(ocnoble) <= 0550) then
            if mesafe < 100 then 
                DrawMarker(2, secilenKonum.x, secilenKonum.y, secilenKonum.z-0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 100, false, true, 2, false, false, false, false)
                if mesafe < 1.5 then
                    DrawText3D(secilenKonum.x, secilenKonum.y, secilenKonum.z, "[E] Topla")
                    if IsControlJustReleased(0, 38) and not isleniyor then
                        isleniyor = true
						local rastgele = math.random(1,#Config.Maddeler)   
                        secilenKonum = #Config.Maddeler[rastgele]
                        exports['mythic_progbar']:Progress({
                            name = "madde_toplama",
                            duration = 60000,
                            label = 'Gizli madde toplanıyor.',
                            useWhileDead = false,
                            canCancel = false,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@world_human_const_drill@male@drill@base",
                                anim = "base",
                                flags = 9,
                            },
							prop = {
                                model = "prop_tool_jackham",
                                bone = 28422,
                                coords = { x = -0.005, y = 0.0, z = 0.0 },
                                rotation = { x = 0.0, y = 0.0, z = 180.0 },
                            }
                        }, function(cancelled)
                            if not cancelled then
								local itemMadde = Config.Madde
								local itemCount = Config.MaddeCount
                                TriggerServerEvent("byte_illegalcraft:giveMadde", itemMadde, itemCount)
                                isleniyor = false
                            end
                        end)
                    end
                end
            end
        end
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 140)
end

