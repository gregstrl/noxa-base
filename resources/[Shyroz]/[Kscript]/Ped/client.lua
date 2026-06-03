function CreateNPC(type,model,anim,dict,pos,help,key,range,start,finish)
  Citizen.CreateThread(function()
    -- Define variables
    local hash = GetHashKey(model)
    local talking = false

    -- Loads model
    RequestModel(hash)
    while not HasModelLoaded(hash) do
      Wait(1)
    end

	-- Loads animation
    RequestAnimDict(anim)
    while not HasAnimDictLoaded(anim) do
      Wait(1)
    end
	
    -- Creates ped when everything is loaded
    local ped = CreatePed(type, hash, pos.x, pos.y, pos.z, pos.h, false, true)
	  SetEntityHeading(ped, pos.h)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskPlayAnim(ped,anim,dict, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
  end)
end

--Location Bateaux
CreateNPC(4,"a_m_y_jetski_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = -1612.9126, y = -1127.9924, z = 1.3027, h = 137.7595})
--Armurerie LSPD
CreateNPC(4,"s_m_y_cop_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = 79.2681, y = -362.7768, z = 40.3317, h = 163.1651})
--Accueil LSPD
CreateNPC(4,"s_m_y_cop_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = 89.4725, y = -416.6631, z = 47.5190, h = 338.2657})
--Garage LSPD
CreateNPC(4,"s_m_y_cop_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = 78.3585, y = -384.9034, z = 38.0166, h = 156.1537})
--Garage 1
CreateNPC(4,"s_m_m_lathandy_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = -349.0666, y = -874.0632, z = 30.3180, h = 178.2894})
--Garage 2
CreateNPC(4,"s_m_m_lathandy_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = -2029.9952, y = -465.9403, z = 10.6040, h = 49.8700})
--Garage 3
CreateNPC(4,"s_m_m_lathandy_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = 1145.1106, y = -466.1413, z = 65.6065, h = 255.5186})
--Garage 4
CreateNPC(4,"s_m_m_lathandy_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = 954.0258, y = -2118.4485, z = 29.5516, h = 353.4013})
--Garage 5
CreateNPC(4,"s_m_m_lathandy_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = 113.5787, y = 6618.5542, z = 30.8671, h = 228.4622})
--Garage 7
CreateNPC(4,"s_m_m_lathandy_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = 1694.1313, y = 4785.0933, z = 40.9215, h = 90.4399})
--Garage 8
CreateNPC(4,"s_m_m_lathandy_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = 275.3367, y = -345.5760, z = 44.1734, h = 90.4399})
--Garage 9
CreateNPC(4,"s_m_m_lathandy_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = 1637.9077, y = 3797.1870, z = 34.2150, h = 215.8361})
--Garage 10
CreateNPC(4,"s_m_m_lathandy_01","amb@world_human_hang_out_street@female_arms_crossed@idle_a","idle_a",{x = -937.5090, y = -2430.9199, z = 12.8388, h = 211.7964})
