ESX, MenuIsOpen, PlayerData = nil, false, {}
WaitMoney, WaitStorage = true, true
AddSpawnVehicle, AddGarage, GetInvite = {}, false, {}

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(10)
		while ESX.GetPlayerData().job == nil do
			Wait(10)
		end
		ESX.PlayerData = ESX.GetPlayerData()
		PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    PlayerData = xPlayer
	TriggerServerEvent("Property:getInfos")
end)

RegisterNetEvent('Property:ReponsePerms')
AddEventHandler('Property:ReponsePerms', function()
	RageUI.CloseAll()
	FreezeEntityPosition(PlayerPedId(), false)
	MenuIsOpen, InProperty = false, true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	PlayerData.job = job
end)

createPropertyType = nil

if Config.PropertySettings.EnableBanner then
	PropertyActionsMenu = RageUI.CreateMenu("", "Intéractions disponibles", nil, nil, "dynasty", "interaction_bgd")
	PropertyGestionMenu = RageUI.CreateSubMenu(PropertyActionsMenu, false, "Intéractions disponibles")
	PropertyInfosMenu = RageUI.CreateSubMenu(PropertyGestionMenu, false, "Intéractions disponibles")
	PropertyBuilderMenu = RageUI.CreateSubMenu(PropertyActionsMenu, false, "Configuration du garage")
else
	PropertyActionsMenu = RageUI.CreateMenu("", "Agence Immobilière Dynsaty 8")
	PropertyGestionMenu = RageUI.CreateSubMenu(PropertyActionsMenu, false, "Agence Immobilière Dynsaty 8")
	PropertyInfosMenu = RageUI.CreateSubMenu(PropertyGestionMenu, false, "Agence Immobilière Dynsaty 8")
	PropertyBuilderMenu = RageUI.CreateSubMenu(PropertyActionsMenu, false, "Agence Immobilière Dynsaty 8")
end
PropertyActionsMenu.Closed = function()
	RageUI.CloseAll()
	viewsMarkers(false)
	Config.BuilderSettings.PropertyInfos = {}
	if Config.BuilderSettings.CheckForView then
		SetEntityCoords(PlayerPedId(), ViewCoordsPlayer.x, ViewCoordsPlayer.y, ViewCoordsPlayer.z)
		TriggerEvent("Property:ViewInteriors", false)
		Config.BuilderSettings.CheckForView = false
	end
	MenuIsOpen, createPropertyType = false, nil
end
PropertyBuilderMenu.Closed = function()
	createPropertyType = false
	resetVar()
	viewsMarkers(false)
	if Config.BuilderSettings.CheckForView then
		SetEntityCoords(PlayerPedId(), ViewCoordsPlayer.x, ViewCoordsPlayer.y, ViewCoordsPlayer.z)
		TriggerEvent("Property:ViewInteriors", false)
		Config.BuilderSettings.CheckForView = false
	end
end

RegisterNetEvent("Property:OpenBuilderMenu")
AddEventHandler("Property:OpenBuilderMenu", function(AllProperties)
	allProperties = AllProperties
    if MenuIsOpen then
        MenuIsOpen = false
        RageUI.Visible(PropertyActionsMenu, false)
    else
        MenuIsOpen = true
        RageUI.Visible(PropertyActionsMenu, true)
        CreateThread(function()
            while MenuIsOpen do
                RageUI.IsVisible(PropertyActionsMenu, function()
					if Config.BuilderSettings.CheckForView then
						SetEntityCoords(PlayerPedId(), ViewCoordsPlayer.x, ViewCoordsPlayer.y, ViewCoordsPlayer.z)
						TriggerEvent("Property:ViewInteriors", false)
						Config.BuilderSettings.CheckForView = false
					end

					RageUI.Button("Créer une propriété", false, {  RightLabel = "→"}, true, {
						onSelected = function()
							createPropertyType = 1
						end
					}, PropertyBuilderMenu)
					RageUI.Button("Créer un garage", false, {  RightLabel = "→"}, true, {
						onSelected = function()
							createPropertyType = 2
						end
					}, PropertyBuilderMenu)
					RageUI.Button("Gestion propriété(s)", false, {  RightLabel = "→"}, true, {}, PropertyGestionMenu)
					RageUI.List("Annonce", Config.BuilderSettings.AnnounceList, Config.BuilderSettings.AnnounceList.Index, nil, {  }, true, {
                        onListChange = function(Index)
                            Config.BuilderSettings.AnnounceList.Index = Index
                        end,
                        onSelected = function(Index)
                            Announce(Index)
                        end
                    })
					RageUI.Button("Faire une Facture", nil, { RightLabel = "→→"}, true, {
						onSelected = function()
							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					
							if closestPlayer ~= -1 and closestDistance <= 3.0 then
								local montant = exports.input:ShowSync("Indiquer le montant de la facture", false, 150, "small_text")
								local raison = exports.input:ShowSync("Indiquer la raison de la facture", false, 150, "text")
					
								if montant and tonumber(montant) and raison and raison ~= "" then
									TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'realestateagent', 'Agence Immobilière', tonumber(montant))
									ESX.ShowNotification("Facture envoyée à ~y~" .. GetPlayerName(closestPlayer) .. " ~s~: ~g~" .. montant .. "$ ~s~pour ~y~" .. raison)
								else
									ESX.ShowNotification("~s~Montant invalide ou raison manquante.")
								end
							else
								ESX.ShowNotification("~s~Aucun joueur à proximité.")
							end
						end
					})
					
					
                end)
                RageUI.IsVisible(PropertyGestionMenu, function()
					if #allProperties > 0 then
						RageUI.List("Filtrer les propriétés : ", Config.BuilderSettings.PropertyList, Config.BuilderSettings.PropertyList.Index, nil, {}, true, {
							onListChange = function(Index)
								Config.BuilderSettings.PropertyList.Index = Index
							end
						})
						RageUI.Line()
						for k,v in pairs (allProperties) do
							if Config.BuilderSettings.PropertyList.Index == 1 then
								RageUI.Button(v.propertyLabel, false, {RightLabel = "Gérer~s~ →",}, true, {
									onSelected = function()
										PropertyID = v.propertyID
									end
								},PropertyInfosMenu)
							elseif Config.BuilderSettings.PropertyList.Index == 2 then
								if v.propertyGarage == nil and v.propertyRented == nil then
									RageUI.Button(v.propertyLabel, false, {RightLabel = "Gérer~s~ →"}, true, {
										onSelected = function()
											PropertyID = v.propertyID
										end
									},PropertyInfosMenu)
								end
							elseif Config.BuilderSettings.PropertyList.Index == 3 then
								if v.propertyEntering == nil then
									RageUI.Button(v.propertyLabel, false, {RightLabel = "Gérer~s~ →"}, true, {
										onSelected = function()
											PropertyID = v.propertyID
										end
									},PropertyInfosMenu)
								end
							end
						end
					else
						RageUI.Separator("")
						RageUI.Separator("Aucune propriété(s) disponibles.")
						RageUI.Separator("")
					end
				end)
				RageUI.IsVisible(PropertyInfosMenu, function()
					local player, distance = ESX.Game.GetClosestPlayer()
					
					for k, v in pairs(allProperties) do
						if PropertyID == v.propertyID then
							RageUI.Separator("Nom de la propriété : " .. v.propertyLabel)
							
							if v.ownerName ~= "-" then
								RageUI.Separator("Nom du propriétaire : " .. tostring(v.ownerName))
							end
							
							if v.propertyEntering ~= nil then
								if v.maxStorage ~= nil then
									RageUI.Separator("Capacité de stockage : " .. v.maxStorage .. " KG")
								end
								
								if v.propertyInteriors and Config.PropertiesInteriors[v.propertyInteriors] then
									RageUI.Separator("Intérieur : " .. tostring(Config.PropertiesInteriors[v.propertyInteriors].PropertyName))
								end
							end
							
							if v.propertyGarage ~= nil and v.propertyRented ~= nil then
								if v.garageInteriors ~= nil then
									if Config.GarageInteriors[v.garageInteriors] then
										RageUI.Separator("Capacité du garage : " .. tostring(#Config.GarageInteriors[v.garageInteriors].AllowedPositions) .. " places")
									end
								end
							end
							
							RageUI.Line()
							RageUI.Button("Mettre un point sur le GPS", false, { RightLabel = "→",}, true, {
								onSelected = function()
									SetNewWaypoint(v.propertyEntering.x, v.propertyEntering.y)
								end
							})
							
							if v.propertyOwner == "-" then
								RageUI.List("Attribuer la propriété : ", {"Moi-même", "Joueurs", "Job", "Job2"}, Config.BuilderSettings.SellList.Index, false, {}, true, {
									onListChange = function(Index)
										Config.BuilderSettings.SellList.Index = Index
									end,
									onSelected = function(Index)
										if Index == 1 then
											SellProperty(v.propertyID, GetPlayerServerId(PlayerId()), "Moi-même")
										elseif Index == 2 then
											SellProperty(v.propertyID, nil, "Joueurs")
										elseif Index == 3 then
											SellProperty(v.propertyID, nil, "Job")
										elseif Index == 4 then
											SellProperty(v.propertyID, nil, "Job2")
										end
									end
								})
							end
							RageUI.Button("Supprimer la propriété", false, { RightLabel = "→" }, true, {
								onSelected = function()
									TriggerServerEvent("Property:DeleteProperty", v.propertyID)
									RageUI.GoBack()
								end
							})
						end
					end
				end)
				RageUI.IsVisible(PropertyBuilderMenu, function()
					local pos = GetEntityCoords(PlayerPedId())
					if createPropertyType == 1 then
						RageUI.Checkbox("Activé le mode visite", false, Config.BuilderSettings.CheckForView, {}, {
							onChecked = function()
								ViewCoordsPlayer = GetEntityCoords(PlayerPedId())
								TriggerEvent("Property:ViewInteriors", true)
							end,
							onUnChecked = function()
								SetEntityCoords(PlayerPedId(), ViewCoordsPlayer.x, ViewCoordsPlayer.y, ViewCoordsPlayer.z)
								TriggerEvent("Property:ViewInteriors", false)
							end,
							onSelected = function(Index)
								Config.BuilderSettings.CheckForView = Index
							end
						})
						
						if IsControlJustPressed(1, 177) and Config.BuilderSettings.CheckForView then
							SetEntityCoords(PlayerPedId(), ViewCoordsPlayer.x, ViewCoordsPlayer.y, ViewCoordsPlayer.z)
							TriggerEvent("Property:ViewInteriors", false)
							Config.BuilderSettings.CheckForView = false
						end
					end
					if createPropertyType == 1 then
						RageUI.Button("Nom de la propriété", false, { RightLabel = LookInfos(PropertyName),}, true, {
							onSelected = function()
								PropertyName = exports.input:ShowSync("Nom de la propriété", false, 150, "small_text")
								if PropertyName ~= nil then
									Config.BuilderSettings.PropertyInfos["NameOfProperty"] = PropertyName
								end
							end
						})
					else
						RageUI.Button("Nom du garage", false, { RightLabel = LookInfos(PropertyName),}, true, {
							onSelected = function()
								PropertyName = exports.input:ShowSync("Nom du garage", false, 150, "small_text")
								if PropertyName ~= nil then
									Config.BuilderSettings.PropertyInfos["NameOfProperty"] = PropertyName
								end
							end
						})
					end
					if createPropertyType == 1 then
						RageUI.List("Propriété", Config.BuilderSettings.InteriorsList, Config.BuilderSettings.InteriorsList.Index, false, {}, true, {
							onListChange = function(Index)
								Config.BuilderSettings.InteriorsList.Index = (Index or 1)
								Config.BuilderSettings.PropertyInfos.Interiors = Config.BuilderSettings.InteriorsList.Index
								if InView == true then
									SetEntityCoords(PlayerPedId(), Config.PropertiesInteriors[(Index or 1)].IPL)
								end
								
								local propertyName = Config.PropertiesInteriors[(Index or 1)].PropertyName
								if propertyName == "Entrepôt (Petit)" then
									Config.BuilderSettings.PropertyInfos.AllowedStorage = 500
									Config.BuilderSettings.StorageList.Index = 1
								elseif propertyName == "Entrepôt (Moyen)" then
									Config.BuilderSettings.PropertyInfos.AllowedStorage = 700
									Config.BuilderSettings.StorageList.Index = 1
								elseif propertyName == "Entrepôt (Grand)" then
									Config.BuilderSettings.PropertyInfos.AllowedStorage = 1000
									Config.BuilderSettings.StorageList.Index = 1
								end
							end
						})
						RageUI.Button("Définir la position de l'entrée", false, {  RightLabel = "→" }, true, {
							onSelected = function()
								viewsMarkers(true)
								Config.BuilderSettings.PropertyInfos.EnteringPos = {x = math.round(pos.x, 2), y = math.round(pos.y, 2), z = math.round(pos.z, 2)}
							end
						})
						local propertyName = Config.PropertiesInteriors[Config.BuilderSettings.InteriorsList.Index].PropertyName
						if not (propertyName == "Entrepôt (Petit)" or propertyName == "Entrepôt (Moyen)" or propertyName == "Entrepôt (Grand)") then
							RageUI.List("EKay de stockage", Config.BuilderSettings.StorageList, Config.BuilderSettings.StorageList.Index, false, {}, true, {
								onListChange = function(Index)
									Config.BuilderSettings.StorageList.Index = (Index or 1)
									Config.BuilderSettings.PropertyInfos.AllowedStorage = tonumber(string.match(Config.BuilderSettings.StorageList[(Index or 1)], "%d+"))
								end
							})
						end
					end
					if AddGarage or createPropertyType == 2 then
						RageUI.List("Nombre de places allouées", Config.BuilderSettings.GarageList, Config.BuilderSettings.GarageList.Index, false, {}, true, {
							onListChange = function(Index)
								Config.BuilderSettings.GarageList.Index = (Index or 1)
								Config.BuilderSettings.PropertyInfos.garageInteriors = Config.BuilderSettings.GarageList.Index
							end
						})
						RageUI.Button("Définir la position du garage", "Position à indiquer pour rentrer dans le garage", {  RightLabel = "→" }, true, {
							onSelected = function()
								viewsMarkers(true)
								Config.BuilderSettings.PropertyInfos.GaragePos = {x = math.round(pos.x, 2), y = math.round(pos.y, 2), z = math.round(pos.z, 2)}
							end
						})
						RageUI.Button("Définir la position du rangement", "Position à indiquer pour ranger un véhicule", {  RightLabel = "→" }, true, {
							onSelected = function()
								viewsMarkers(true)
								Config.BuilderSettings.PropertyInfos.RentedPos = {x = math.round(pos.x, 2), y = math.round(pos.y, 2), z = math.round(pos.z, 2), w = math.round(GetEntityHeading(PlayerPedId()), 2)}
							end
						})
					end
					RageUI.Line()
					if createPropertyType == 1 then
						if Config.BuilderSettings.PropertyInfos["NameOfProperty"] ~= nil and Config.BuilderSettings.PropertyInfos.EnteringPos ~= nil then
							RageUI.Button("Créer la Propriété", false, {  RightLabel = "→" }, true, {
								onSelected = function()
									if Config.BuilderSettings.PropertyInfos.AllowedStorage == nil then
										Config.BuilderSettings.PropertyInfos.AllowedStorage = 50
									end
									if Config.BuilderSettings.PropertyInfos.Interiors == nil then
										Config.BuilderSettings.PropertyInfos.Interiors = 1
									end
									if Config.BuilderSettings.PropertyInfos.garageInteriors == nil then
										Config.BuilderSettings.PropertyInfos.garageInteriors = 1
									end
									if Config.BuilderSettings.CheckForView then
										SetEntityCoords(PlayerPedId(), ViewCoordsPlayer.x, ViewCoordsPlayer.y, ViewCoordsPlayer.z)
										TriggerEvent("Property:ViewInteriors", false)
										Config.BuilderSettings.CheckForView = false
									end
									TriggerServerEvent("Property:AddProperty", Config.BuilderSettings.PropertyInfos)
									Wait(50)
									Config.BuilderSettings.PropertyInfos = {}
									resetVar()
								end
							})
						else
							RageUI.Button("Créer la Propriété", false, {}, false, {})
						end
					else
						if Config.BuilderSettings.PropertyInfos["NameOfProperty"] ~= nil and Config.BuilderSettings.PropertyInfos.GaragePos ~= nil and Config.BuilderSettings.PropertyInfos.RentedPos ~= nil then
							RageUI.Button("Créer le Garage", false, {  RightLabel = "→" }, true, {
								onSelected = function()
									if Config.BuilderSettings.PropertyInfos.garageInteriors == nil then
										Config.BuilderSettings.PropertyInfos.garageInteriors = 1
									end
									TriggerServerEvent("Property:AddProperty", Config.BuilderSettings.PropertyInfos)
									resetVar()
								end
							})
						else
							RageUI.Button("Créer le Garage", false, {}, false, {})
						end
					end
                end)
                Wait(1)
            end
            
            if Config.BuilderSettings.CheckForView then
                SetEntityCoords(PlayerPedId(), ViewCoordsPlayer.x, ViewCoordsPlayer.y, ViewCoordsPlayer.z)
                TriggerEvent("Property:ViewInteriors", false)
                Config.BuilderSettings.CheckForView = false
            end
        end)
    end
end)

CreateThread(function()
    while true do
		if PlayerData.job ~= nil and PlayerData.job.name == Config.PropertySettings.AllowedJob then
            Wait(5)
            if IsControlJustReleased(0, 167) then
				TriggerServerEvent("Property:openJobInteractionsMenu")
            end
        else
            Wait(500)
        end
    end
end)

if Config.PropertySettings.EnableBanner then
	OwnedPropertyInteractionsMenu = RageUI.CreateMenu(false, "Intéractions disponibles", nil, nil, "dynasty", "interaction_bgd")
	PropertyAccessMenu = RageUI.CreateSubMenu(OwnedPropertyInteractionsMenu, false, "Gestion des accès")
else
	OwnedPropertyInteractionsMenu = RageUI.CreateMenu('', "Intéractions disponibles")
	PropertyAccessMenu = RageUI.CreateSubMenu(OwnedPropertyInteractionsMenu, '', "Gestion des accès")
end
OwnedPropertyInteractionsMenu.Closed = function()
	RageUI.CloseAll()
    MenuIsOpen = false
	if isOwned == false then
		myProperties = {}
	end
	FreezeEntityPosition(PlayerPedId(), false)
end

RegisterNetEvent("Property:OpenPropertyMenu")
AddEventHandler("Property:OpenPropertyMenu", function(isOwned, InfosOfProperty)
	myProperties = InfosOfProperty
    if MenuIsOpen then
        MenuIsOpen = false
        RageUI.Visible(OwnedPropertyInteractionsMenu, false)
    else
        MenuIsOpen = true
        RageUI.Visible(OwnedPropertyInteractionsMenu, true)
        CreateThread(function()
            while MenuIsOpen do
				FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(OwnedPropertyInteractionsMenu, function()
					for k,v in pairs (InfosOfProperty) do
						if isOwned == true then
							RageUI.Separator("Nom de la Propriété : "..v.propertyLabel)
							RageUI.Separator("Adresse : "..GetStreetForCoords(v.propertyEntering.x, v.propertyEntering.y, v.propertyEntering.z))
							RageUI.Line()

							if HasPropertyAccess(v) then
								RageUI.Button("Entrer dans la propriété", false, { RightLabel = "→"}, true, {
									onSelected = function()
										EnterProperty(v.propertyInteriors, v.propertyID, false)
									end
								})
							end

							if HasManagementRights(v) then
								RageUI.Button("Gérer", false, { RightLabel = "→"}, true, {
									onSelected = function()
										TriggerServerEvent("Property:GetAccessList", v.propertyID)
									end
								}, PropertyAccessMenu)
							end
						else
							RageUI.Separator("Nom de la Propriété : "..v.propertyLabel)
							RageUI.Separator("Adresse : "..GetStreetForCoords(v.propertyEntering.x, v.propertyEntering.y, v.propertyEntering.z))
							RageUI.Line()

							if v.propertyOwner ~= "-" then
								RageUI.Button("Sonner à la porte", false, { RightLabel = "→"}, true, {
									onSelected = function()
										TriggerServerEvent("Property:DringDring", v.propertyOwner)
									end
								})
								if Config.PropertySettings.ActivateForcedDoor then
									for _, job in pairs(Config.PropertySettings.AllowedJobs) do
										if PlayerData.job.name == job then
											RageUI.Button("Entrer de force dans la propriété", false, { RightLabel = "→"}, true, {
												onSelected = function()
													EnterProperty(v.propertyInteriors, v.propertyID, false)
												end
											})
										end
									end
								end
							else
								RageUI.Button("Visiter la propriété", false, { RightLabel = "→"}, true, {
									onSelected = function()
										EnterProperty(v.propertyInteriors, v.propertyID, true)
									end
								})
								RageUI.Button("Sonner à la porte", false, { RightLabel = "→"}, false, {})
							end
						end
					end
				end)
				RageUI.IsVisible(PropertyAccessMenu, function()
					local player, distance = ESX.Game.GetClosestPlayer()
					
					RageUI.Button("Donner l'accès au joueur le plus proche", false, { RightLabel = "→"}, true, {
						onSelected = function()
							if player ~= -1 and distance <= 3.0 then
								for k, v in pairs(myProperties) do
									if v.propertyID then
										TriggerServerEvent("Property:GiveAccess", v.propertyID, GetPlayerServerId(player))
									end
								end
							else
								ESX.ShowNotification("~s~Aucun joueur à proximité")
							end
						end
					})
					
					RageUI.Separator("↓ Liste des accès ↓")
					
					for k, v in pairs(myProperties) do
						if v.accessList then
							local accessList = type(v.accessList) == 'string' and json.decode(v.accessList) or v.accessList
							if accessList and #accessList > 0 then
								for _, access in pairs(accessList) do
									RageUI.Button(access.name or "Inconnu", false, { RightLabel = "Retirer →"}, true, {
										onSelected = function()
											TriggerServerEvent("Property:RemoveAccess", v.propertyID, access.identifier)
										end
									})
								end
							else
								RageUI.Separator("Aucun accès enregistré")
							end
						else
							RageUI.Separator("Aucun accès enregistré")
						end
					end
				end)
                Wait(1)
            end
        end)
    end
end)

if Config.PropertySettings.EnableBanner then
	PropertyGarageMenu = RageUI.CreateMenu(false, "Intéractions disponibles", nil, nil, "dynasty", "interaction_bgd")
else
	PropertyGarageMenu = RageUI.CreateMenu('', "Intéractions disponibles")
end
PropertyGarageMenu.Closed = function()
	RageUI.CloseAll()
    MenuIsOpen = false
	if isOwned == false then
		myProperties = {}
		myVehicles = {}
	end
	FreezeEntityPosition(PlayerPedId(), false)
end

garageCooldown = false

RegisterNetEvent("Property:OpenGarageMenu")
AddEventHandler("Property:OpenGarageMenu", function(isOwned, InfosOfProperty, VehiclesOfProperty)
	myProperties = InfosOfProperty
	if VehiclesOfProperty ~= nil then
		myVehicles = VehiclesOfProperty
	end
    if MenuIsOpen then
        MenuIsOpen = false
        RageUI.Visible(PropertyGarageMenu, false)
    else
        MenuIsOpen = true
        RageUI.Visible(PropertyGarageMenu, true)
        CreateThread(function()
            while MenuIsOpen do
				FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(PropertyGarageMenu, function()
					for k,v in pairs (myProperties) do
						if isOwned == true then
							RageUI.Separator("Nom de la Propriété : "..v.propertyLabel)
							RageUI.Separator("Adresse : "..GetStreetForCoords(v.propertyGarage.x, v.propertyGarage.y, v.propertyGarage.z))
							RageUI.Line()
							RageUI.Button("Entrer dans le garage", false, {RightLabel = "→"}, true, {
								onSelected = function() 
									if not garageCooldown then
										garageCooldown = true
										EnterGarage(false)
										SetTimeout(2000, function()
											garageCooldown = false
										end)
									end
								end
							})
						else
							RageUI.Separator("Nom de la Propriété : "..v.propertyLabel)
							RageUI.Separator("Adresse : "..GetStreetForCoords(v.propertyGarage.x, v.propertyGarage.y, v.propertyGarage.z))
							RageUI.Line()
							if v.propertyOwner == "-" then
								RageUI.Button("Visiter le garage", false, {RightLabel = "→"}, true, {
									onSelected = function()
										EnterGarage(true)
									end
								})
							else
								RageUI.Button("Visiter le garage", false, {RightLabel = "→"}, false, {})
							end
						end
					end
				end)
                Wait(1)
            end
        end)
    end
end)

if Config.PropertySettings.EnableBanner then
	OwnedPropertyGestionMenu = RageUI.CreateMenu(false, "Intéractions disponibles", nil, nil, "dynasty", "interaction_bgd")
else
	OwnedPropertyGestionMenu = RageUI.CreateMenu('', "Intéractions disponibles")
end
OwnedPropertyGestionMenu.Closed = function()
    MenuIsOpen = false
	RageUI.Visible(OwnedPropertyGestionMenu, false)
	FreezeEntityPosition(PlayerPedId(), false)
end

RegisterNetEvent("Property:OpenGestionMenu")
AddEventHandler("Property:OpenGestionMenu", function()
    if MenuIsOpen then
        MenuIsOpen = false
        RageUI.Visible(OwnedPropertyGestionMenu, false)
    else
        MenuIsOpen = true
        RageUI.Visible(OwnedPropertyGestionMenu, true)
        CreateThread(function()
            while MenuIsOpen do
				FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(OwnedPropertyGestionMenu, function()
					for k,v in pairs(myProperties) do
						RageUI.Button("Sortir de la propriété", false, {RightLabel = "→",}, true, {
							onSelected = function()
								ExitProperty(v.propertyID)
							end
						})
						if #GetInvite > 0 then
							RageUI.Separator("↓ Demande en cours..~s~ ↓")
							for t,b in pairs (GetInvite) do
								RageUI.Button("Faire rentrer ("..b.playerName.."~s~) dans la propriété", false, {RightLabel = "→"}, true, {
									onSelected = function()
										table.remove(GetInvite, t)
										TriggerServerEvent("Property:AcceptDringDring", b.source, v.propertyID)
									end
								})
							end
						end
					end
				end)
                Wait(1)
            end
        end)
    end
end)

waitingForVehicles, myGarageInteriors, garageCooldown = false, nil, false

if Config.PropertySettings.EnableBanner then
	OwnedPropertyGarageMenu = RageUI.CreateMenu(false, "Intéractions disponibles", nil, nil, "dynasty", "interaction_bgd")
	OwnedPropertyVehiclesMenu = RageUI.CreateSubMenu(OwnedPropertyGarageMenu, false, "Intéractions disponibles")
	OwnedGarageVehiclesMenu = RageUI.CreateSubMenu(OwnedPropertyGarageMenu, false, "Intéractions disponibles")
else
	OwnedPropertyGarageMenu = RageUI.CreateMenu('', "Intéractions disponibles")
	OwnedPropertyVehiclesMenu = RageUI.CreateSubMenu(OwnedPropertyGarageMenu, '', "Intéractions disponibles")
	OwnedGarageVehiclesMenu = RageUI.CreateSubMenu(OwnedPropertyGarageMenu, '', "Intéractions disponibles")
end
OwnedPropertyGarageMenu.Closed = function()
	RageUI.CloseAll()
    MenuIsOpen, myGarageInteriors, waitingForVehicles = false, nil, false
	FreezeEntityPosition(PlayerPedId(), false)
end

RegisterNetEvent("Property:OpenGestionGarageMenu")
AddEventHandler("Property:OpenGestionGarageMenu", function(OwnedVehicles, GarageVehicles)
	myOwnedVehicles = OwnedVehicles
	myGarageVehicles = GarageVehicles
    if MenuIsOpen then
        MenuIsOpen = false
        RageUI.Visible(OwnedPropertyGarageMenu, false)
    else
        MenuIsOpen = true
        RageUI.Visible(OwnedPropertyGarageMenu, true)
		for k,v in pairs(myProperties) do
			myGarageInteriors = v.garageInteriors
		end
        CreateThread(function()
            while MenuIsOpen do
				FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(OwnedPropertyGarageMenu, function()
					RageUI.Button("Gestion véhicule(s) garage public", false, {RightLabel = "→"}, true, {
						onSelected = function()
							Wait(120)
							waitingForVehicles = true
						end
					}, OwnedPropertyVehiclesMenu)
					RageUI.Button("Gestion véhicule(s) de la propriété", false, {RightLabel = "→"}, true, {
						onSelected = function()
							Wait(120)
							waitingForVehicles = true
						end
					}, OwnedGarageVehiclesMenu)
				end)
				RageUI.IsVisible(OwnedPropertyVehiclesMenu, function()
					if waitingForVehicles then
						if #myOwnedVehicles > 0 then
							for k,v in pairs(myProperties) do
								for t,b in pairs (myOwnedVehicles) do
									if #myGarageVehicles == #Config.GarageInteriors[myGarageInteriors].AllowedPositions then
										RageUI.Separator("Place(s) disponibles : "..#myGarageVehicles.."~s~/"..#Config.GarageInteriors[myGarageInteriors].AllowedPositions)
										RageUI.Line()
										RageUI.Button(""..GetVehicleLabel(b.vehicle.model).."~s~ - ["..b.plate.."~s~]", false, {RightLabel = "→"}, false,  {})
									else
										RageUI.Separator("Place(s) disponibles : "..#myGarageVehicles.."~s~/"..#Config.GarageInteriors[myGarageInteriors].AllowedPositions)
										RageUI.Line()
										RageUI.Button(""..GetVehicleLabel(b.vehicle.model).."~s~ - ["..b.plate.."~s~]", false, {RightLabel = "→",}, true, {
											onSelected = function()
												if not garageCooldown then
													garageCooldown = true
													TriggerServerEvent("Property:InteractionsGarage", v.propertyID, b.vehicle, 1)
													SetTimeout(750, function()
														garageCooldown = false
													end)
												end
											end
										})
									end
								end
							end
						else
							RageUI.Separator("")
							RageUI.Separator("Vous n'avez aucun véhicule.")
							RageUI.Separator("")
						end
					end
				end)
				RageUI.IsVisible(OwnedGarageVehiclesMenu, function()
					if waitingForVehicles then
						if #myGarageVehicles > 0 then
							if #myGarageVehicles < #Config.GarageInteriors[myGarageInteriors].AllowedPositions then
								RageUI.Separator("Place(s) disponibles : "..#myGarageVehicles.."~s~/"..#Config.GarageInteriors[myGarageInteriors].AllowedPositions)
							else
								RageUI.Separator("Place(s) disponibles : MAX")
							end
							RageUI.Line()
							for k,v in pairs(myProperties) do
								for t,b in pairs (myGarageVehicles) do
									if b.stored == 1 then
										OwnedPrefix = "Rentré~s~"
									else
										OwnedPrefix = "Sortie~s~"
									end
									if v.propertyID == v.propertyID then
										RageUI.Button(""..GetVehicleLabel(b.data_vehicle.model).."~s~ - ["..b.plate.."~s~]", false, {RightLabel = "["..OwnedPrefix.."]"}, true, {
											onSelected = function()
												if b.stored == 1 then
													if not garageCooldown then
														garageCooldown = true
														TriggerServerEvent("Property:InteractionsGarage", v.propertyID, b.data_vehicle, 2)
														SetTimeout(750, function()
															garageCooldown = false
														end)
													end
												end
											end
										})
									end
								end
							end
						else
							RageUI.Separator("")
							RageUI.Separator("Vous n'avez aucun véhicule.")
							RageUI.Separator("")
						end
					end
				end)
                Wait(1)
            end
        end)
    end
end)

if Config.PropertySettings.EnableBanner then
	OwnedPropertyStorageMenu = RageUI.CreateMenu(false, "Intéractions disponibles", nil, nil, "dynasty", "interaction_bgd")
	OwnedPropertyStorageAddMenu = RageUI.CreateSubMenu(OwnedPropertyStorageMenu, false, "Intéractions disponibles")
	OwnedPropertyStorageRemoveMenu = RageUI.CreateSubMenu(OwnedPropertyStorageMenu, false, "Intéractions disponibles")
else
	OwnedPropertyStorageMenu = RageUI.CreateMenu('', "Intéractions disponibles")
	OwnedPropertyStorageAddMenu = RageUI.CreateSubMenu(OwnedPropertyStorageMenu, '', "Intéractions disponibles")
	OwnedPropertyStorageRemoveMenu = RageUI.CreateSubMenu(OwnedPropertyStorageMenu, '', "Intéractions disponibles")
end
OwnedPropertyStorageMenu.Closed = function()
	RageUI.CloseAll()
    MenuIsOpen = false
	FreezeEntityPosition(PlayerPedId(), false)
end

actionCooldown = false

local storageUpdated = false

RegisterNetEvent("Property:reloadStorage")
AddEventHandler("Property:reloadStorage", function(propertyID, newData)
    for k, v in pairs(myProperties) do
        if v.propertyID == propertyID then
            v.data = newData
            countData(propertyID) 
        end
    end
end)

local menuStorageType = { "Items", "Weapons" }
local menuStorageIndex = 1 

blockedWeapons = blockedWeapons or {
    "WEAPON_A15RC",
    "WEAPON_NEVA",
    "weapon_carbinerifle_mk2",
    "WEAPON_IAR",
    "WEAPON_M133",
    "WEAPON_GLOCK17",
    "WEAPON_JRBAK",
    "WEAPON_FAMASU1",
    "WEAPON_UMP45",
    "WEAPON_UZI",
    "WEAPON_ENERGYKNIFE",
    "WEAPON_KARAMBIT",
    "weapon_specialcarbine_mk2",
    "WEAPON_GYS",
    "WEAPON_M416P",

    "weapon_pumpshotgun",
    "weapon_smg_mk2",
    "weapon_heavysniper",
    "WEAPON_AWP",

    "WEAPON_COMBATPISTOL",
    "WEAPON_CARBINERIFLE",
    "WEAPON_STUNGUN",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_MUSKET",
    "WEAPON_SWITCHBLADE"
}

RegisterNetEvent("Property:OpenStorageMenu")
AddEventHandler("Property:OpenStorageMenu", function(propertyID)
    if MenuIsOpen then
        MenuIsOpen = false
        RageUI.Visible(OwnedPropertyStorageMenu, false)
        TriggerServerEvent("Property:ReleaseStorageAccess", propertyID)
    else
        MenuIsOpen = true
        RageUI.Visible(OwnedPropertyStorageMenu, true)
        Wait(250)
        refreshInventory()
        countData(propertyID)

        CreateThread(function()
            while MenuIsOpen do
                FreezeEntityPosition(PlayerPedId(), true)

                if storageUpdated then
                    countData(propertyID)
                    storageUpdated = false
                end
                
                if IsControlJustPressed(0, 177) and GetLastInputMethod(2) and not RageUI.IsVisible(OwnedPropertyStorageAddMenu) and not RageUI.IsVisible(OwnedPropertyStorageRemoveMenu) then
                    MenuIsOpen = false
                    RageUI.Visible(OwnedPropertyStorageMenu, false)
                    FreezeEntityPosition(PlayerPedId(), false)
                    TriggerServerEvent("Property:ReleaseStorageAccess", propertyID)
                end
                
                RageUI.IsVisible(OwnedPropertyStorageMenu, function()
					local player, distance = ESX.Game.GetClosestPlayer()
					if WaitMoney == true then
						for k,v in pairs(myProperties) do
							if propertyID == v.propertyID then
								if v.dataMoney ~= nil then
									for t,b in pairs(v.dataMoney) do
										if v.propertyID == propertyID then
											if player ~= -1 and distance <= 1.2 then
											else
												if t == "dirtycash" then
													RageUI.List("Argent sale : "..v.dataMoney["dirtycash"].count.."$", Config.BuilderSettings.dataMoneyList[1], Config.BuilderSettings.dataMoneyList[1].Index, false, {}, true, {
														onListChange = function(Index)
															Config.BuilderSettings.dataMoneyList[1].Index = Index
														end,
														onSelected = function(Index)
															if Index == 1 then
																local count = exports.input:ShowSync("Argent sale à déposer dans le stock", false, 150, "small_text")
																if count ~= nil then
																	count = tonumber(count)
																	if type(count) == "number" then
																		TriggerServerEvent("Property:ActionsMoney", v.propertyID, v.dataMoney, t, count, 1, 1)
																		WaitMoney = false
																		Wait(250)
																		WaitMoney = true
																	end
																end
															elseif Index == 2 then
																local count = exports.input:ShowSync("Argent sale à retirer du stock", false, 150, "small_text")
																if count ~= nil then
																	count = tonumber(count)
																	if type(count) == "number" then
																		TriggerServerEvent("Property:ActionsMoney", v.propertyID, v.dataMoney, t, count, 1, 2)
																		WaitMoney = false
																		Wait(250)
																		WaitMoney = true
																	end
																end
															end
														end
													})
												else
													RageUI.List("Argent propre : "..v.dataMoney["cash"].count.."$", Config.BuilderSettings.dataMoneyList[2], Config.BuilderSettings.dataMoneyList[2].Index, false, {}, true, {
														onListChange = function(Index)
															Config.BuilderSettings.dataMoneyList[2].Index = Index
														end,
														onSelected = function(Index)
															if Index == 1 then
																local count = exports.input:ShowSync("Argent propre à déposer dans le stock", false, 150, "small_text")
																if count ~= nil then
																	count = tonumber(count)
																	if type(count) == "number" then
																		TriggerServerEvent("Property:ActionsMoney", v.propertyID, v.dataMoney, t, count, 2, 1)
																		WaitMoney = false
																		Wait(250)
																		WaitMoney = true
																	end
																end
															elseif Index == 2 then
																local count = exports.input:ShowSync("Argent propre à retirer du stock", false, 150, "small_text")
																if count ~= nil then
																	count = tonumber(count)
																	if type(count) == "number" then
																		TriggerServerEvent("Property:ActionsMoney", v.propertyID, v.dataMoney, t, count, 2, 2)
																		WaitMoney = false
																		Wait(250)
																		WaitMoney = true
																	end
																end
															end
														end
													})
												end
											end
										end
									end
								end
							end
							RageUI.Button("Déposer un objet", false, {RightLabel = "→"}, true, {
								onSelected = function()
									getData(v.propertyID)
									refreshInventory()
								end
							},OwnedPropertyStorageAddMenu)
							RageUI.Button("Retirer un objet", false, {RightLabel = "→"}, true, {
								onSelected = function()
									countData(v.propertyID)
								end
							},OwnedPropertyStorageRemoveMenu)
						end
					end
				end)
				RageUI.IsVisible(OwnedPropertyStorageAddMenu, function()
					RageUI.Separator("Capacité de stockage: "..countStorage.count.."~s~/"..countStorage.max.." ~s~KG")
				
					RageUI.List("Sélectionner Type", menuStorageType, menuStorageIndex, nil, {}, true, {
						onListChange = function(Index)
							menuStorageIndex = Index
						end
					})
					
					if menuStorageIndex == 1 then
						if #ESX.PlayerData.inventory > 0 then
							for k, v in pairs(ESX.PlayerData.inventory) do
								if v.count > 0 then
									RageUI.Button(v.count.."x - "..v.label, false, {RightLabel = "→"}, true, {
										onSelected = function()
											local count = exports.input:ShowSync("Quantité à déposer dans le stock", false, 150, "small_text")
											if count ~= nil then
												count = tonumber(count)
												if type(count) == "number" then
													WaitStorage = false
													TriggerServerEvent("Property:ActionsStorage", propertyID, DataStorage, v.name, countStorage, count, 1)
													Wait(120)
													refreshInventory()
												end
											end
										end
									})
								end
							end
						else
							RageUI.Separator("")
							RageUI.Separator("Aucun item sur vous.")
							RageUI.Separator("")
						end
					end
				
					if menuStorageIndex == 2 then
						if #ESX.PlayerData.loadout > 0 then
					
							for k, v in pairs(ESX.PlayerData.loadout) do
								local isBlocked = false
					
								for _, blockedWeapon in ipairs(blockedWeapons) do
									if v.name == blockedWeapon then
										isBlocked = true
										break
									end
								end
					
								if not isBlocked then
									RageUI.Button(v.label, false, {RightLabel = "→"}, true, {
										onSelected = function()
											TriggerServerEvent("Property:ActionsStorage", propertyID, DataStorage, v.name, countStorage, 1, 1)
											Wait(120)
											refreshInventory()
										end
									})
								else
									RageUI.Separator("~s~" .. v.label .. " (Bloquée)")
								end
							end
						else
							RageUI.Separator("")
							RageUI.Separator("Aucune arme sur vous.")
							RageUI.Separator("")
						end
					end
									
				end)
				
				
				RageUI.IsVisible(OwnedPropertyStorageRemoveMenu, function()
				
					if WaitStorage == true then
						RageUI.Separator("Capacité : "..countStorage.count.."~s~/"..countStorage.max.."KG")
					end
				
					if countStorage.count > 0 then
						for k, v in pairs(myProperties) do
							if v.propertyID == propertyID then
								if v.data ~= nil then
									for t, b in pairs(v.data) do
										if v.data[t] and v.data[t].count and v.data[t].count > 0 then
											RageUI.Button(v.data[t].label.."~s~ - ["..v.data[t].count.."~s~]", false, {RightLabel = "→"}, true, {
												onSelected = function()
													local count = exports.input:ShowSync("Quantité à retirer", false, 150, "small_text")
													if count ~= nil then
														count = tonumber(count)
														if type(count) == "number" then
															TriggerServerEvent("Property:ActionsStorage", propertyID, v.data, v.data[t].name, countStorage, count, 2)
														end
													end
												end
											})
										end
									end
								end
				
								if v.data["weapons"] ~= nil and #v.data["weapons"] > 0 then
									RageUI.Separator("~s~Armes Stockées :")
									for _, weapon in pairs(v.data["weapons"]) do
										RageUI.Button(weapon.label, false, {RightLabel = "→"}, true, {
											onSelected = function()
												TriggerServerEvent("Property:ActionsStorage", propertyID, v.data, weapon.name, countStorage, 1, 2)
											end
										})
									end
								end
							end
						end
					else
						RageUI.Separator("Aucun objet ou arme disponible.") 
					end
				end)
                
                if not MenuIsOpen then
                    TriggerServerEvent("Property:ReleaseStorageAccess", propertyID)
                    FreezeEntityPosition(PlayerPedId(), false)
                    break
                end
                
                Wait(0)
            end
        end)
    end
end)

RegisterNetEvent("Property:OpenStorageMenuConfirmed")
AddEventHandler("Property:OpenStorageMenuConfirmed", function(propertyID)
    TriggerEvent("Property:OpenStorageMenu", propertyID)
end)

ownerList, ownerCooldown = {}, false

if Config.PropertySettings.EnableBanner then
	PropertyOwnerMenu = RageUI.CreateMenu(false, "Intéractions disponibles", nil, nil, "dynasty", "interaction_bgd")
	PropertyOwnerAddMenu = RageUI.CreateSubMenu(PropertyOwnerMenu, false, "Liste des joueurs")
	PropertyOwnerListMenu = RageUI.CreateSubMenu(PropertyOwnerMenu, false, "Liste des co-propriétaires")
else
	PropertyOwnerMenu = RageUI.CreateMenu('', "Intéractions disponibles")
	PropertyOwnerAddMenu = RageUI.CreateSubMenu(PropertyOwnerMenu, "", "Liste des joueurs")
	PropertyOwnerListMenu = RageUI.CreateSubMenu(PropertyOwnerMenu, "", "Liste des co-propriétaires")
end
PropertyOwnerMenu.Closed = function()
	RageUI.CloseAll()
    MenuIsOpen = false
end

RegisterNetEvent("Property:OpenOwnerMenu")
AddEventHandler("Property:OpenOwnerMenu", function(propertyOwnerInfos, availablePlayers, propertyOwner, propertyID)
    if not propertyID then return end

    CurrentProperty = propertyID
    ownerList, potentialOwners = {}, {}

    for _, owner in ipairs(propertyOwnerInfos) do
        if owner.identifier ~= propertyOwner then 
            table.insert(ownerList, owner)
        end
    end

    for _, player in ipairs(availablePlayers) do
        if player.identifier ~= propertyOwner then
            table.insert(potentialOwners, player)
        end
    end

    if MenuIsOpen then
        MenuIsOpen = false
        RageUI.Visible(PropertyOwnerMenu, false)
    else
        MenuIsOpen = true
        RageUI.Visible(PropertyOwnerMenu, true)

        CreateThread(function()
            while MenuIsOpen do
                RageUI.IsVisible(PropertyOwnerMenu, function()
                    RageUI.Button("Liste des co-propriétaires", nil, {}, true, {}, PropertyOwnerListMenu)
                    RageUI.Button("Ajouter un co-propriétaire", nil, {}, true, {}, PropertyOwnerAddMenu)
                end)

                RageUI.IsVisible(PropertyOwnerAddMenu, function()
                    if #potentialOwners > 0 then
                        for _, v in ipairs(potentialOwners) do
                            RageUI.Button(v.playerName, nil, {RightLabel = "Ajouter"}, true, {
                                onSelected = function()
                                    if not CurrentProperty then return end
                                    TriggerServerEvent("Property:addOwner", CurrentProperty, v.id)
                                    Wait(500)
                                    RageUI.CloseAll()
                                    TriggerServerEvent("Property:RefreshOwnerList", CurrentProperty)
                                end
                            })
                        end
                    else
                        RageUI.Separator("Aucun joueur disponible.")
                    end
                end)

                RageUI.IsVisible(PropertyOwnerListMenu, function()
                    if #ownerList > 0 then
                        for _, v in ipairs(ownerList) do
                            RageUI.Button(v.name or "Inconnu", nil, {RightLabel = "Retirer"}, true, {
                                onSelected = function()
                                    if not CurrentProperty then return end
                                    TriggerServerEvent("Property:deleteOwner", CurrentProperty, v.identifier)
                                    Wait(500)
                                    RageUI.CloseAll()
                                    TriggerServerEvent("Property:RefreshOwnerList", CurrentProperty)
                                end
                            })
                        end
                    else
                        RageUI.Separator("Aucun co-propriétaire.")
                    end
                end)

                Wait(1)
            end
        end)
    end
end)

function SellProperty(propertyID, target, jobType)
    if jobType == "Moi-même" then
        TriggerServerEvent("Property:GivePropertyToPlayer", propertyID, GetPlayerServerId(PlayerId()))
    elseif jobType == "Joueurs" then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 3.0 then
            TriggerServerEvent("Property:GivePropertyToPlayer", propertyID, GetPlayerServerId(closestPlayer))
        else
            ESX.ShowNotification("~s~Aucun joueur à proximité.")
        end
    elseif jobType == "Job" or jobType == "Job2" then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 3.0 then
            TriggerServerEvent("Property:GetTargetJob", propertyID, GetPlayerServerId(closestPlayer), jobType)
        else
            ESX.ShowNotification("~s~Aucun joueur à proximité.")
        end
    end
end

RegisterNetEvent("Property:SetPropertyJob")
AddEventHandler("Property:SetPropertyJob", function(propertyID, jobName)
    TriggerServerEvent("Property:GivePropertyToJob", propertyID, jobName)
end)

function HasPropertyAccess(property)
    local xPlayer = ESX.GetPlayerData()
    local isOwner = property.propertyOwner == xPlayer.identifier
    local isCoOwner = false
    local isJobOwner = false
    local hasAccess = false

    if property.coOwners then
        for _, owner in pairs(property.coOwners) do
            if owner.identifier == xPlayer.identifier then
                isCoOwner = true
                break
            end
        end
    end

    if string.find(property.propertyOwner or "", "job_") then
        local jobName = string.gsub(property.propertyOwner, "job_", "")
        if xPlayer.job.name == jobName or xPlayer.job2.name == jobName then
            isJobOwner = true
        end
    end

    if property.accessList then
        local accessList = type(property.accessList) == 'string' and json.decode(property.accessList) or property.accessList
        if accessList then
            for _, access in pairs(accessList) do
                if access.identifier == xPlayer.identifier then
                    hasAccess = true
                    break
                end
            end
        end
    end

    return isOwner or isCoOwner or isJobOwner or hasAccess
end

function HasManagementRights(property)
    local xPlayer = ESX.GetPlayerData()
    local isOwner = property.propertyOwner == xPlayer.identifier
    local isCoOwner = false
    local isJobOwner = false

    if property.coOwners then
        for _, owner in pairs(property.coOwners) do
            if owner.identifier == xPlayer.identifier then
                isCoOwner = true
                break
            end
        end
    end

    if string.find(property.propertyOwner or "", "job_") then
        local jobName = string.gsub(property.propertyOwner, "job_", "")
        if xPlayer.job.name == jobName or xPlayer.job2.name == jobName then
            isJobOwner = true
        end
    end

    return isOwner or isCoOwner or isJobOwner
end









