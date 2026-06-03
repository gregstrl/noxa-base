local selectedCaseId = nil

function Afk:openAfkExitMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local main_case = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local main_case_get = RageUI.CreateSubMenu(main_case, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator('~r~↓ AFK ↓~s~')
            local mins = Afk.myInformations.time
            local hours = math.floor(mins / 60)
            local minutes = mins % 60
            
            local time_result = '0 minutes'
            if hours > 0 then
                time_result = math.floor(hours) .. 'h'
            end
            if minutes > 0 then
                if hours > 0 then
                    time_result = time_result .. math.floor(minutes)
                else
                    time_result = math.floor(minutes) .. ' minutes'
                end
            end
            
            RageUI.Separator(('Temps Passé: ~r~%s~s~'):format(time_result))
            RageUI.Separator(('Vos Points: ~r~%s~s~'):format(Afk.myInformations.points))
            RageUI.Button('Quitter la Zone AFK', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    TriggerServerEvent('Koy:afk:exit')

                    RageUI.CloseAll()
                end
            })
            RageUI.Line()
            for k,v in ipairs(Afk.Case) do
                RageUI.Button(v.label, nil, {RightLabel = ("~r~%s Points~s~"):format(v.price)}, true, {
                    onSelected = function()
                        selectedCaseId = k

                        RageUI.Visible(main_case, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(main_case, function()
            RageUI.Button('Acheter la Caisse', nil, {RightLabel = ("~r~%s Points~s~"):format(Afk.Case[selectedCaseId].price)}, true, {
                onSelected = function()
                    if tonumber(Afk.myInformations.points) < tonumber(Afk.Case[selectedCaseId].price) then
                        ESX.ShowNotification('~r~Vous ne possedez pas les points requis~s~')
                        return
                    end

                    RageUI.CloseAll()

                    TriggerServerEvent('Koy:afk:buyCase', selectedCaseId)
                end
            })
            RageUI.Button('Visualiser les Lots', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    
                end
            }, main_case_get)
        end)

        RageUI.IsVisible(main_case_get, function()
            pictureVisu = nil
            for k,v in ipairs(Afk.Case[selectedCaseId].rewards) do
                RageUI.Button(("%s ~r~x%s~s~"):format(v.label, v.count), nil, {RightLabel = ('%s Chance sur %s'):format(v.chance, #Afk.Case[selectedCaseId].rewards)}, true, {
                    onActive = function()
                        pictureVisu = v.name

                        if pictureVisu then
                            RageUI.RenderCaissePreview("afk", pictureVisu)
                        end
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(main_case) and not RageUI.Visible(main_case_get) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end


function Afk:openClassement()
    local classement = nil
    
    ESX.TriggerServerCallback('Koy:afk:getClassement', function(cb)
        classement = cb
        table.sort(classement, function(a, b)
            return tonumber(a.points) > tonumber(b.points)
        end)
        ShowClassementMenu(classement)
    end)
end

function ShowClassementMenu(classement)
    local main = RageUI.CreateMenu('Classement AFK', 'Actions Disponibles')
    RageUI.Visible(main, not RageUI.Visible(main))
    
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            if classement then
                for k, v in ipairs(classement) do
                    if k == 1 then
                        RageUI.Button(('%s - %s points'):format(v.playerName, v.points), nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                            onSelected = function()
                                
                            end
                        })
                    else
                        RageUI.Button(('%s - %s points'):format(v.playerName, v.points), nil, {}, true, {
                            onSelected = function()
                                
                            end
                        })
                    end
                end
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end



local count = false

RegisterNetEvent('Koy:afk:exit', function()
    Afk.myInformations.inZone = false
    DoScreenFadeOut(2000)
    Wait(3000)
    local ped = PlayerPedId()
    SetEntityCoords(ped, Afk.NPC.pos)
    DoScreenFadeIn(2000)
    exports['Koyui']:hideInfo()

    --SetEntityInvincible(ped, false)

    if DoesEntityExist(Afk.LeaderPed1) then
        DeleteEntity(Afk.LeaderPed1)
    end

    count = true

    Wait(180000)

    count = false
end)

RegisterNetEvent('Koy:afk:enter', function(notif)
    DoScreenFadeOut(2000)
    Wait(3000)
    SetEntityCoords(PlayerPedId(), Afk.Zone)
    DoScreenFadeIn(2000)
    if notif then
        ESX.ShowNotification('Vous vous êtes déconnecté en Zone AFK')
    end
    CreateThread(function()
        local mins = Afk.myInformations.time
        local hours = math.floor(mins / 60)
        local minutes = mins % 60
        
        local time_result = '0 minutes'
        if hours > 0 then
            time_result = math.floor(hours) .. 'h'
        end
        if minutes > 0 then
            if hours > 0 then
                time_result = time_result .. math.floor(minutes)
            else
                time_result = math.floor(minutes) .. ' minutes'
            end
        end

        TriggerEvent('esx_basicneeds:healPlayer')

        exports['Koyui']:drawInfo([[
            AFK-FARM
        ]], {
            {title = "Temps passé", subtitle = time_result},
            {title = "Points", subtitle = Afk.myInformations.points},
            {title = "Informations", subtitle = "5 Points pour 3 Minutes."}
        })
        while Afk.myInformations.inZone do 
            Wait(180000)

            if not count then
                if not Afk.myInformations.inZone then break end

                TriggerServerEvent('Koy:afk:addPoints')
    
                ESX.ShowNotification('+5 ~g~Points d\'AFK~s~')
            end
        end

        if Afk.AfkNPC.myPed2 then 
            if DoesEntityExist(Afk.AfkNPC.myPed2) then 
                DeleteEntity(Afk.AfkNPC.myPed2)
                Afk.AfkNPC.myPed2 = nil
            end
        end

        exports['Koyui']:hideInfo()
    end)

    local disableKey = {
        {group = 2, key = 37},
		{group = 0, key = 24},
		{group = 0, key = 69},
		{group = 0, key = 92},
		{group = 0, key = 106},
		{group = 0, key = 168},
		{group = 0, key = 160},
		{group = 0, key = 160},
    }

    CreateThread(function()
        while Afk.myInformations.inZone do
            Wait(1)

            local ped = PlayerPedId()

            for k,v in pairs(disableKey) do
                --NetworkSetFriendlyFireOption(false)
                
                SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                DisableControlAction(v.group, v.key, true)
            end

           -- SetEntityInvincible(ped, true)
            SetEntityHealth(ped, 200)

            local mins = Afk.myInformations.time
            local hours = math.floor(mins / 60)
            local minutes = mins % 60
            
            local time_result = '0 minutes'
            if hours > 0 then
                time_result = math.floor(hours) .. 'h'
            end
            if minutes > 0 then
                if hours > 0 then
                    time_result = time_result .. math.floor(minutes)
                else
                    time_result = math.floor(minutes) .. ' minutes'
                end
            end

            local dist = #(GetEntityCoords(ped)-vector3(Afk.Zone.x, Afk.Zone.y, Afk.Zone.z))

            if dist > 200 then
                SetEntityCoords(ped, Afk.Zone)

                ESX.ShowNotification('~r~Vous vous eloignez trop de la Zone.~s~')
            end

            exports['Koyui']:drawInfo([[
                AFK-FARM
            ]], {
                {title = "Temps passé", subtitle = time_result},
                {title = "Points", subtitle = Afk.myInformations.points},
                {title = "Informations", subtitle = "5 Points pour 3 Minutes."}
            })
        end
    end)

    local firstName = "NONE"

    CreateThread(function()
        ESX.TriggerServerCallback("Koy:afk:selectFirstPlayersPoints", function(cb)
            if cb then
                firstName = cb[2]
                ESX.Game.SpawnLocalPed(1, "mp_m_freemode_01", Afk.Leaderboard[1], 183.65728759766, function(ped)
                    Wait(1000)
                    FreezeEntityPosition(ped, true)
                    SetEntityInvincible(ped, true)
                    SetBlockingOfNonTemporaryEvents(ped, true)

                    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_GUARD_STAND')
                    Afk.LeaderPed1 = ped
                    
                    Character = cb[1]
                    playerPed = ped

                    local face_weight = 		0
                    local skin_weight =			0
                    -- if Character['face'] ~= nil and Character['skin'] ~= nil and Character['skin'] ~= nil and Character['face'] ~= nil then
                    -- 	SetPedHeadBlendData(playerPed, Character['face'], Character['face'], Character['face'], Character['skin'], Character['skin'], Character['skin'], 1.0, 1.0, 1.0, true)
                    -- else
                        SetPedHeadBlendData(playerPed, Character['mom'], Character['mom'], 0, Character['dad'], Character['dad'], 0, face_weight, skin_weight, 0.0, false)
                    -- end
                    SetPedFaceFeature			(playerPed,			0,								(Character['nose_1'] / 10) + 0.0)			-- Nose Width
                    SetPedFaceFeature			(playerPed,			1,								(Character['nose_2'] / 10) + 0.0)			-- Nose Peak Height
                    SetPedFaceFeature			(playerPed,			2,								(Character['nose_3'] / 10) + 0.0)			-- Nose Peak Length
                    SetPedFaceFeature			(playerPed,			3,								(Character['nose_4'] / 10) + 0.0)			-- Nose Bone Height
                    SetPedFaceFeature			(playerPed,			4,								(Character['nose_5'] / 10) + 0.0)			-- Nose Peak Lowering
                    SetPedFaceFeature			(playerPed,			5,								(Character['nose_6'] / 10) + 0.0)			-- Nose Bone Twist
                    SetPedFaceFeature			(playerPed,			6,								(Character['eyebrows_5'] / 10) + 0.0)		-- Eyebrow height
                    SetPedFaceFeature			(playerPed,			7,								(Character['eyebrows_6'] / 10) + 0.0)		-- Eyebrow depth
                    SetPedFaceFeature			(playerPed,			8,								(Character['cheeks_1'] / 10) + 0.0)			-- Cheekbones Height
                    SetPedFaceFeature			(playerPed,			9,								(Character['cheeks_2'] / 10) + 0.0)			-- Cheekbones Width
                    SetPedFaceFeature			(playerPed,			10,								(Character['cheeks_3'] / 10) + 0.0)			-- Cheeks Width
                    SetPedFaceFeature			(playerPed,			11,								(Character['eye_squint'] / 10) + 0.0)		-- Eyes squint
                    SetPedFaceFeature			(playerPed,			12,								(Character['lip_thickness'] / 10) + 0.0)	-- Lip Fullness
                    SetPedFaceFeature			(playerPed,			13,								(Character['jaw_1'] / 10) + 0.0)			-- Jaw Bone Width
                    SetPedFaceFeature			(playerPed,			14,								(Character['jaw_2'] / 10) + 0.0)			-- Jaw Bone Length
                    SetPedFaceFeature			(playerPed,			15,								(Character['chin_1'] / 10) + 0.0)			-- Chin Height
                    SetPedFaceFeature			(playerPed,			16,								(Character['chin_2'] / 10) + 0.0)			-- Chin Length
                    SetPedFaceFeature			(playerPed,			17,								(Character['chin_3'] / 10) + 0.0)			-- Chin Width
                    SetPedFaceFeature			(playerPed,			18,								(Character['chin_4'] / 10) + 0.0)			-- Chin Hole Size
                    SetPedFaceFeature			(playerPed,			19,								(Character['neck_thickness'] / 10) + 0.0)	-- Neck Thickness

                    SetPedHairColor				(playerPed,			Character['hair_color_1'],		Character['hair_color_2'])					-- Hair Color
                    SetPedHeadOverlay			(playerPed, 3,		Character['age_1'],				(Character['age_2'] / 10) + 0.0)			-- Age + opacity
                    SetPedHeadOverlay			(playerPed, 1,		Character['beard_1'],			(Character['beard_2'] / 10) + 0.0)			-- Beard + opacity
                    SetPedEyeColor				(playerPed,			Character['eye_color'], 0, 1)												-- Eyes color
                    SetPedHeadOverlay			(playerPed, 2,		Character['eyebrows_1'],		(Character['eyebrows_2'] / 10) + 0.0)		-- Eyebrows + opacity
                    SetPedHeadOverlay			(playerPed, 4,		Character['makeup_1'],			(Character['makeup_2'] / 10) + 0.0)			-- Makeup + opacity
                    SetPedHeadOverlay			(playerPed, 8,		Character['lipstick_1'],		(Character['lipstick_2'] / 10) + 0.0)		-- Lipstick + opacity
                    SetPedComponentVariation	(playerPed, 2,		Character['hair_1'],			Character['hair_2'], 2)						-- Hair
                    SetPedHeadOverlayColor		(playerPed, 1, 1,	Character['beard_3'],			Character['beard_4'])						-- Beard Color
                    SetPedHeadOverlayColor		(playerPed, 2, 1,	Character['eyebrows_3'],		Character['eyebrows_4'])					-- Eyebrows Color
                    SetPedHeadOverlayColor		(playerPed, 4, 2,	Character['makeup_3'],			Character['makeup_4'])						-- Makeup Color
                    SetPedHeadOverlayColor		(playerPed, 8, 1,	Character['lipstick_3'],		Character['lipstick_4'])					-- Lipstick Color
                    SetPedHeadOverlay			(playerPed, 5,		Character['blush_1'],			(Character['blush_2'] / 10) + 0.0)			-- Blush + opacity
                    SetPedHeadOverlayColor		(playerPed, 5, 2,	Character['blush_3'])														-- Blush Color
                    SetPedHeadOverlay			(playerPed, 6,		Character['complexion_1'],		(Character['complexion_2'] / 10) + 0.0)		-- Complexion + opacity
                    SetPedHeadOverlay			(playerPed, 9,		Character['moles_1'],			(Character['moles_2'] / 10) + 0.0)			-- Moles/Freckles + opacity
                    SetPedHeadOverlayColor		(playerPed, 10, 1,	Character['chest_3'])														-- Torso Color

                    if Character['ears_1'] == -1 then
                        ClearPedProp(playerPed, 2)
                    else
                        SetPedPropIndex			(playerPed, 2,		Character['ears_1'],			Character['ears_2'], 2)						-- Ears Accessories
                    end

                    SetPedComponentVariation	(playerPed, 8,		Character['tshirt_1'],			Character['tshirt_2'], 2)					-- Tshirt
                    SetPedComponentVariation	(playerPed, 11,		Character['torso_1'],			Character['torso_2'], 2)					-- torso parts
                    SetPedComponentVariation	(playerPed, 3,		Character['arms'],				Character['arms_2'], 2)						-- Amrs
                    SetPedComponentVariation	(playerPed, 10,		Character['decals_1'],			Character['decals_2'], 2)					-- decals
                    SetPedComponentVariation	(playerPed, 4,		Character['pants_1'],			Character['pants_2'], 2)					-- pants
                    SetPedComponentVariation	(playerPed, 6,		Character['shoes_1'],			Character['shoes_2'], 2)					-- shoes
                    SetPedComponentVariation	(playerPed, 1,		Character['mask_1'],			Character['mask_2'], 2)						-- mask
                    SetPedComponentVariation	(playerPed, 9,		Character['bproof_1'],			Character['bproof_2'], 2)					-- bulletproof
                    SetPedComponentVariation	(playerPed, 7,		Character['chain_1'],			Character['chain_2'], 2)					-- chain
                    SetPedComponentVariation	(playerPed, 5,		Character['bags_1'],			Character['bags_2'], 2)						-- Bag

                    if Character['helmet_1'] == -1 then
                        ClearPedProp(playerPed, 0)
                    else
                        SetPedPropIndex			(playerPed, 0,		Character['helmet_1'],			Character['helmet_2'], 2)					-- Helmet
                    end

                    if Character['glasses_1'] == -1 then
                        ClearPedProp(playerPed, 1)
                    else
                        SetPedPropIndex			(playerPed, 1,		Character['glasses_1'],			Character['glasses_2'], 2)					-- Glasses
                    end

                    if Character['watches_1'] == -1 then
                        ClearPedProp(playerPed, 6)
                    else
                        SetPedPropIndex			(playerPed, 6,		Character['watches_1'],			Character['watches_2'], 2)					-- Watches
                    end

                    if Character['bracelets_1'] == -1 then
                        ClearPedProp(playerPed,	7)
                    else
                        SetPedPropIndex			(playerPed, 7,		Character['bracelets_1'],		Character['bracelets_2'], 2)				-- Bracelets
                    end
                end)
            end
        end)
    end)

    CreateThread(function()
        local interval = 2000

        while Afk.myInformations.inZone do
            Wait(interval)

            interval = 2000

            local player = PlayerPedId()

            local dist = #(GetEntityCoords(player)-vector3(-1262.347656, -3012.678467, -48.490150))
            -- local dist2 = #(GetEntityCoords(player)-Afk.Leaderboard[1])

            -- if dist > 50 and dist2 > 50 then goto continue end

            if dist < 50 then
                if not DoesEntityExist(Afk.AfkNPC.myPed2) then 
                    if Afk.AfkNPC.myPed2 == nil then
                
                        ESX.Game.SpawnLocalPed(2, "s_f_y_casino_01", vector3(-1262.347656, -3012.678467, -48.490150-0.98), 92.302040100098, function(ped)
                            if Afk.AfkNPC.myPed2 then
                                DeleteEntity(Afk.AfkNPC.myPed2)
                                Afk.AfkNPC.myPed2 = nil
                            end
                            Afk.AfkNPC.myPed2 = ped

                            FreezeEntityPosition(ped, true)
                            SetEntityInvincible(ped, true)
                            SetBlockingOfNonTemporaryEvents(ped, true)

                            TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD')
                        end)
                    end
                else
                    if dist < 15 and DoesEntityExist(Afk.AfkNPC.myPed2) then 
                        interval = 1000
                        Afk.AfkNPC.tag2 = CreateFakeMpGamerTag(Afk.AfkNPC.myPed2, Afk.NPC.name, true, false, 'NPC', 1)
                        SetMpGamerTagColour(Afk.AfkNPC.tag2, 0, 1)
                        SetMpGamerTagVisibility(Afk.AfkNPC.tag2, 14, true)
                        SetMpGamerTagColour(Afk.AfkNPC.tag2, 14, 1)
                        SetMpGamerTagAlpha(Afk.AfkNPC.tag2, 14, 255)
                        SetMpGamerTagHealthBarColor(Afk.AfkNPC.tag3, 1)

                        if dist < 2 then
                            interval = 1
                            DrawInstructionBarNotification(-1262.347656, -3012.678467, -48.490150, "[~r~E~s~] Pour intéragir")

                            if IsControlJustPressed(0, 54) then
                                Afk:openAfkExitMenu()
                            end
                        end
                    else
                        if Afk.AfkNPC.tag2 then 
                            RemoveMpGamerTag(Afk.AfkNPC.tag2)
                            Afk.AfkNPC.tag2 = nil
                        end
                    end
                end
            else
                if Afk.AfkNPC.myPed2 then 
                    if DoesEntityExist(Afk.AfkNPC.myPed2) then 
                        DeleteEntity(Afk.AfkNPC.myPed2)
                        Afk.AfkNPC.myPed2 = nil
                    end
                end
            end
        end
    end)

    CreateThread(function()
        local interval = 2000
        while Afk.myInformations.inZone do 
            Wait(interval)

            interval = 2000

            local player = PlayerPedId()
            local dist2 = #(GetEntityCoords(player)-Afk.Leaderboard[1])

            if dist2 < 50 then
                if dist2 < 15 and DoesEntityExist(Afk.LeaderPed1) then 
                    interval = 1000
                    Afk.AfkNPC.tag3 = CreateFakeMpGamerTag(Afk.LeaderPed1, firstName.. " ".. "👑", true, false, 'NPC', 1)
                    SetMpGamerTagColour(Afk.AfkNPC.tag3, 0, 120)

                    SetMpGamerTagVisibility(Afk.AfkNPC.tag3, 7, true)

                    SetMpGamerTagColour(Afk.AfkNPC.tag3, 14, 120)
                    SetMpGamerTagAlpha(Afk.AfkNPC.tag3, 14, 255)
                    SetMpGamerTagHealthBarColor(Afk.AfkNPC.tag3, 120)

                    if dist2 < 2 then
                        if dist2 < 2 then
                            interval = 1
                            DrawInstructionBarNotification(Afk.Leaderboard[1].x, Afk.Leaderboard[1].y, Afk.Leaderboard[1].z, "[~r~E~s~] Pour intéragir")

                            if IsControlJustPressed(0, 54) then
                                Afk:openClassement()
                            end
                        end
                    end
                else
                    if Afk.AfkNPC.tag3 then 
                        RemoveMpGamerTag(Afk.AfkNPC.tag3)
                        Afk.AfkNPC.tag3 = nil
                    end
                end
            end
        end
    end)
end)